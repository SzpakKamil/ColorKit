//
//  CKColor.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI

#if canImport(CoreImage)
  import CoreImage
#endif

#if canImport(UIKit)
  import UIKit
  public typealias NativeColor = UIColor
#elseif canImport(AppKit)
  import AppKit
  public typealias NativeColor = NSColor
#endif

// MARK: - CKColor
public struct CKColor: Identifiable, Sendable, Codable, Equatable, Hashable,
  CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable
{

  // MARK: - Optimized Identity (Fix #1)

  /// A 128-bit value-type identifier.
  /// Eliminates string allocation overhead during diffing/hashing.
  public struct Identifier: Hashable, Sendable, Codable {
    let primary: UInt64
    let secondary: UInt64

    /// Generates a stable, collision-resistant hash based on the color definition state.
    fileprivate static func generate(
      p: ColorDefinition, d: ColorDefinition?, hc: ColorDefinition?, hcd: ColorDefinition?,
      cs: CKColor.ColorSpace
    ) -> Identifier {
      var hasher = Hasher()
      hasher.combine(p.id)
      hasher.combine(d?.id)
      hasher.combine(hc?.id)
      hasher.combine(hcd?.id)
      hasher.combine(cs.rawValue)
      let h1 = UInt64(bitPattern: Int64(hasher.finalize()))

      var mixer = Hasher()
      mixer.combine(cs.rawValue)
      mixer.combine(p.id)
      let h2 = UInt64(bitPattern: Int64(mixer.finalize()))

      return Identifier(primary: h1, secondary: h2)
    }
  }

  public let colorSpace: CKColor.ColorSpace

  /// A unique, stable identifier for this color configuration.
  /// Calculated via bit-packing for O(1) access performance.
  public let id: Identifier

  public var darkId: String? { dark?.id }
  public var highContrastId: String? { highContrast?.id }
  public var highContrastDarkId: String? { highContrastDark?.id }

  public var isLight: Bool { luminance > 0.5 }
  public var isDark: Bool { !isLight }
  public var luminance: Double {
    guard let c = components else { return 0.5 }
    return CKColor.Luminance.calculate(for: c, in: colorSpace)
  }

  public func opacity(_ amount: Double) -> CKColor {
    guard let c = components else { return self }
    return CKColor(
      red: c.r, green: c.g, blue: c.b, opacity: c.a * amount, colorSpace: self.colorSpace)
  }

  // MARK: - Internal Properties
  let primary: ColorDefinition
  let dark: ColorDefinition?
  let highContrast: ColorDefinition?
  let highContrastDark: ColorDefinition?

  /// Pre-calculated components for efficient dynamic resolution.
  internal let resolvedNativeComponents: ResolvedComponents

  internal struct ResolvedComponents: Sendable, Codable, Equatable, Hashable {
    let light: RGBA
    let dark: RGBA
    let highContrast: RGBA
    let highContrastDark: RGBA
  }

  internal var components: RGBA? {
    switch primary {
    case .standard(let name): return CKColor.registry[name]?.components
    case .custom(let converter): return converter.rgba
    }
  }

  internal var darkComponents: RGBA? {
    switch dark {
    case .standard(let name): return CKColor.registry[name]?.components
    case .custom(let converter): return converter.rgba
    case .none: return nil
    }
  }

  internal var highContrastComponents: RGBA? {
    switch highContrast {
    case .standard(let name): return CKColor.registry[name]?.components
    case .custom(let converter): return converter.rgba
    case .none: return nil
    }
  }

  internal var highContrastDarkComponents: RGBA? {
    switch highContrastDark {
    case .standard(let name): return CKColor.registry[name]?.components
    case .custom(let converter): return converter.rgba
    case .none: return nil
    }
  }

  // MARK: - Descriptions
  public var description: String {
    if let metadata = Self.registry[primary.id] { return metadata.localizedKey }
    return "ColorKit.CustomColor"
  }
    
    public var localizedDescription: String {
        if #available (iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *){
            return String(localized: .init(description), bundle: .module)
        } else {
            return NSLocalizedString(.init(description), bundle: .module, comment: "")
        }
    }

  public var debugDescription: String {
    return "CKColor(id: \(id.primary)-\(id.secondary), space: \(colorSpace.rawValue))"
  }

  public var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "id": id,
        "colorSpace": colorSpace,
        "luminance": luminance,
        "isLight": isLight,
      ])
  }

  // MARK: - Codable

  private enum CodingKeys: String, CodingKey {
    case id, darkId, highContrastId, highContrastDarkId, colorSpace
    case components, darkComponents, highContrastComponents, highContrastDarkComponents
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let idRaw = try container.decode(String.self, forKey: .id)
    let darkId = try container.decodeIfPresent(String.self, forKey: .darkId)
    let highContrastId = try container.decodeIfPresent(String.self, forKey: .highContrastId)
    let highContrastDarkId = try container.decodeIfPresent(String.self, forKey: .highContrastDarkId)
    let colorSpace = try container.decode(CKColor.ColorSpace.self, forKey: .colorSpace)

    let resolveDef = { (id: String, key: CodingKeys) -> ColorDefinition? in
      let clean = id.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
      if CKColor.isStandardName(clean) {
        return .standard(name: clean)
      }
      if let comps = try? container.decodeIfPresent(RGBA.self, forKey: key) {
        let effectiveHeadroom = (colorSpace == .displayP3) ? comps.headroom : nil
        return .custom(
          CKColor.Converter(
            red: comps.r, green: comps.g, blue: comps.b, alpha: comps.a, headroom: effectiveHeadroom
          ))
      }
      if let converter = CKColor.Converter(clean) {
        return .custom(converter)
      }
      return nil
    }

    guard let primary = resolveDef(idRaw, .components) else {
      throw DecodingError.dataCorruptedError(
        forKey: .id, in: container, debugDescription: "Invalid color ID")
    }

    let dark = darkId.flatMap { resolveDef($0, .darkComponents) }
    let highContrast = highContrastId.flatMap { resolveDef($0, .highContrastComponents) }
    let highContrastDark = highContrastDarkId.flatMap {
      resolveDef($0, .highContrastDarkComponents)
    }

    self.init(
      primary: primary, dark: dark, highContrast: highContrast, highContrastDark: highContrastDark,
      colorSpace: colorSpace)
  }

  internal init?(
    id: String, darkId: String? = nil, highContrastId: String? = nil,
    highContrastDarkId: String? = nil, colorSpace: CKColor.ColorSpace = .sRGB
  ) {
    guard let primary = Self.makeDefinition(from: id) else { return nil }
    let dark = darkId.flatMap { Self.makeDefinition(from: $0) }
    let highContrast = highContrastId.flatMap { Self.makeDefinition(from: $0) }
    let highContrastDark = highContrastDarkId.flatMap { Self.makeDefinition(from: $0) }
    self.init(
      primary: primary, dark: dark, highContrast: highContrast, highContrastDark: highContrastDark,
      colorSpace: colorSpace)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(primary.id, forKey: .id)
    try container.encodeIfPresent(dark?.id, forKey: .darkId)
    try container.encodeIfPresent(highContrast?.id, forKey: .highContrastId)
    try container.encodeIfPresent(highContrastDark?.id, forKey: .highContrastDarkId)
    try container.encode(colorSpace, forKey: .colorSpace)

    if case .custom = primary, let c = components {
      try container.encode(c, forKey: .components)
    }
    if let d = dark, case .custom = d, let c = darkComponents {
      try container.encode(c, forKey: .darkComponents)
    }
    if let h = highContrast, case .custom = h, let c = highContrastComponents {
      try container.encode(c, forKey: .highContrastComponents)
    }
    if let hd = highContrastDark, case .custom = hd, let c = highContrastDarkComponents {
      try container.encode(c, forKey: .highContrastDarkComponents)
    }
  }

  // MARK: - Native Conversion

  public var color: Color { Color(nativeColor) }

  public var nativeColor: NativeColor {
    if dark == nil && highContrast == nil && highContrastDark == nil,
      let metadata = Self.registry[primary.id]
    {
      return metadata.native
    }

    #if canImport(UIKit)
      #if os(watchOS)
        return resolveNative(
          from: primary.id, components: resolvedNativeComponents.light, space: colorSpace)
      #else
        return UIColor { traitCollection in
          let isDark = traitCollection.userInterfaceStyle == .dark
          let isHighContrast = traitCollection.accessibilityContrast == .high

          let c: RGBA
          if isHighContrast {
            c =
              isDark
              ? resolvedNativeComponents.highContrastDark : resolvedNativeComponents.highContrast
          } else if isDark {
            c = resolvedNativeComponents.dark
          } else {
            c = resolvedNativeComponents.light
          }
          return resolveNative(from: "resolved", components: c, space: colorSpace)
        }
      #endif
    #elseif canImport(AppKit)
      return NSColor(name: nil) { appearance in
        let match = appearance.bestMatch(from: [
          .aqua, .darkAqua, .accessibilityHighContrastAqua, .accessibilityHighContrastDarkAqua,
        ])
        let c: RGBA?
        if match == .darkAqua {
          c = resolvedNativeComponents.dark
        } else if match == .accessibilityHighContrastAqua {
          c = resolvedNativeComponents.highContrast
        } else if match == .accessibilityHighContrastDarkAqua {
          c = resolvedNativeComponents.highContrastDark
        } else {
          c = resolvedNativeComponents.light
        }
        return resolveNative(from: "resolved", components: c, space: colorSpace)
      }
    #endif
  }

  private func resolveNative(from input: String, components: RGBA?, space: CKColor.ColorSpace)
    -> NativeColor
  {
    if let metadata = Self.registry[input] {
      return metadata.native
    }

    if let c = components {
      #if canImport(UIKit) || canImport(AppKit)
        let multiplier = (space == .displayP3) ? (c.headroom ?? 1.0) : 1.0
        let cgColor: CGColor?

        if multiplier > 1.0 {
          let linear = space.linearRepresentation(for: c)
          let targetSpaceName: CFString
          switch space {
          case .displayP3:
            if #available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *) {
              targetSpaceName = CGColorSpace.extendedLinearDisplayP3
            } else {
              targetSpaceName = CGColorSpace.extendedLinearSRGB
            }
          default:
            targetSpaceName = CGColorSpace.extendedLinearSRGB
          }

          if let cgSpace = CGColorSpace(name: targetSpaceName) {
            cgColor = CGColor(
              colorSpace: cgSpace,
              components: [
                CGFloat(linear.r), CGFloat(linear.g), CGFloat(linear.b), CGFloat(linear.a),
              ])
          } else {
            cgColor = nil
          }
        } else {
          let cgSpaceName: CFString
          switch space {
          case .sRGB, .hsl, .cmyk, .lab, .okLab, .lch: cgSpaceName = CGColorSpace.sRGB
          case .sRGBLinear: cgSpaceName = CGColorSpace.linearSRGB
          case .extendedLinearSRGB: cgSpaceName = CGColorSpace.extendedLinearSRGB
          case .extendedSRGB: cgSpaceName = CGColorSpace.extendedSRGB
          case .displayP3: cgSpaceName = CGColorSpace.displayP3
          case .adobeRGB: cgSpaceName = CGColorSpace.adobeRGB1998
          case .rommRGB: cgSpaceName = CGColorSpace.rommrgb
          }

          if let cgSpace = CGColorSpace(name: cgSpaceName) {
            cgColor = CGColor(
              colorSpace: cgSpace,
              components: [CGFloat(c.r), CGFloat(c.g), CGFloat(c.b), CGFloat(c.a)])
          } else {
            cgColor = nil
          }
        }
        if let cgColor = cgColor {
          #if canImport(UIKit)
            return NativeColor(cgColor: cgColor)
          #else
            return NativeColor(cgColor: cgColor)
              ?? NativeColor(red: c.r, green: c.g, blue: c.b, alpha: c.a)
          #endif
        }
      #endif

      switch space {
      case .displayP3:
        return NativeColor(displayP3Red: c.r, green: c.g, blue: c.b, alpha: c.a)
      default:
        return NativeColor(red: c.r, green: c.g, blue: c.b, alpha: c.a)
      }
    }
    return NativeColor(red: 0, green: 0, blue: 0, alpha: 1)
  }

  // MARK: - Parsing Helpers
  static func makeDefinition(from id: String) -> ColorDefinition? {
    let clean = id.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    if CKColor.isStandardName(clean) {
      return .standard(name: clean)
    }
    if let converter = CKColor.Converter(clean) {
      return .custom(converter)
    }
    return nil
  }

  // MARK: - Unified Initialization Logic (Fix #2)

  internal init(
    primary: ColorDefinition, dark: ColorDefinition?, highContrast: ColorDefinition?,
    highContrastDark: ColorDefinition? = nil, colorSpace: CKColor.ColorSpace
  ) {
    self.primary = primary
    self.dark = dark
    self.highContrast = highContrast
    self.highContrastDark = highContrastDark
    self.colorSpace = colorSpace

    // 1. Resolve: Centralize logic to prevent "sprawl"
    let fallback = RGBA(r: 0, g: 0, b: 0, a: 1)

    let p = CKColor.resolveComponents(for: primary, fallback: fallback, space: colorSpace)
    let d = dark.map { CKColor.resolveComponents(for: $0, fallback: p, space: colorSpace) } ?? p

    // 2. Compute Contrast Variants: Use helper for algorithmic generation
    let hc =
      highContrast.map { CKColor.resolveComponents(for: $0, fallback: p, space: colorSpace) }
      ?? CKColor.adjustContrast(p, makeDarker: true)

    let hcd =
      highContrastDark.map { CKColor.resolveComponents(for: $0, fallback: d, space: colorSpace) }
      ?? CKColor.adjustContrast(d, makeDarker: false)

    self.resolvedNativeComponents = ResolvedComponents(
      light: p,
      dark: d,
      highContrast: hc,
      highContrastDark: hcd
    )

    // 3. Generate ID: Bit-packed for O(1) performance
    self.id = Identifier.generate(
      p: primary, d: dark, hc: highContrast, hcd: highContrastDark, cs: colorSpace)
  }

  // MARK: - Private Logic Helpers

  /// Resolves components from a definition, applying headroom sanitization if necessary.
  private static func resolveComponents(
    for def: ColorDefinition, fallback: RGBA, space: CKColor.ColorSpace
  ) -> RGBA {
    let raw: RGBA
    switch def {
    case .standard(let name):
      raw = CKColor.registry[name]?.components ?? fallback
    case .custom(let converter):
      raw = converter.rgba
    }

    // Sanitize Headroom
    if space != .displayP3 && raw.headroom != nil {
      return RGBA(r: raw.r, g: raw.g, b: raw.b, a: raw.a, headroom: nil)
    }
    return raw
  }

  /// Algorithmic contrast adjustment for automatic high-contrast variant generation.
  private static func adjustContrast(_ c: RGBA, makeDarker: Bool) -> RGBA {
    let factor = 0.45
    let newR: Double
    let newG: Double
    let newB: Double

    if makeDarker {
      newR = c.r * (1.0 - factor)
      newG = c.g * (1.0 - factor)
      newB = c.b * (1.0 - factor)
    } else {
      newR = c.r + (1.0 - c.r) * factor
      newG = c.g + (1.0 - c.g) * factor
      newB = c.b + (1.0 - c.b) * factor
    }
    return RGBA(r: newR, g: newG, b: newB, a: c.a, headroom: c.headroom)
  }
}

