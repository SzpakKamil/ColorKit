//
//  CKColor-Inits.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import CoreGraphics
import SwiftUI

#if canImport(CoreImage)
  import CoreImage
#endif
#if canImport(UIKit)
  import UIKit
#elseif canImport(AppKit)
  import AppKit
#endif

extension CKColor {
  // MARK: - Initializers
  public init(
    hexString: String, hexStringDark: String? = nil, hexStringHighContrast: String? = nil,
    hexStringHighContrastDark: String? = nil, colorSpace: CKColor.ColorSpace = .sRGB
  ) {
    if let instance = CKColor(
      id: hexString, darkId: hexStringDark, highContrastId: hexStringHighContrast,
      highContrastDarkId: hexStringHighContrastDark, colorSpace: colorSpace)
    {
      self = instance
    } else {
      let converter = CKColor.Converter(red: 0, green: 0, blue: 0, alpha: 1)
      self.init(
        primary: .custom(converter), dark: nil, highContrast: nil, highContrastDark: nil,
        colorSpace: .sRGB)
    }
  }

  public init(
    hexInt: Int, hexIntDark: Int? = nil, hexIntHighContrast: Int? = nil,
    hexIntHighContrastDark: Int? = nil, colorSpace: CKColor.ColorSpace = .sRGB
  ) {
    // 1. Create the primary light mode definition (Mandatory)
    let primaryDef = ColorDefinition.custom(CKColor.Converter(hexInt))

    // 2. Create optional definitions
    let darkDef = hexIntDark.flatMap { ColorDefinition.custom(CKColor.Converter($0)) }
    let hcDef = hexIntHighContrast.flatMap { ColorDefinition.custom(CKColor.Converter($0)) }
    let hcDarkDef = hexIntHighContrastDark.flatMap { ColorDefinition.custom(CKColor.Converter($0)) }

    // 3. Initialize
    self.init(
      primary: primaryDef, dark: darkDef, highContrast: hcDef, highContrastDark: hcDarkDef,
      colorSpace: colorSpace)
  }

  public init(
    light: CKColor, dark: CKColor? = nil, highContrast: CKColor? = nil,
    highContrastDark: CKColor? = nil, colorSpace: ColorSpace? = nil
  ) {
    let targetSpace = colorSpace ?? light.colorSpace

    let align = { (source: CKColor) -> ColorDefinition in
      if source.colorSpace == targetSpace {
        return source.primary
      }
      if let converter = CKColor.Converter(color: source.nativeColor, in: targetSpace) {
        return .custom(converter)
      }
      return source.primary
    }

    let primaryDef = light.primary
    let darkDef = dark.map(align)
    let hcDef = highContrast.map(align)
    let hcDarkDef = highContrastDark.map(align)

    self.init(
      primary: primaryDef, dark: darkDef, highContrast: hcDef, highContrastDark: hcDarkDef,
      colorSpace: targetSpace)
  }

  public init(
    red: Double, green: Double, blue: Double, opacity: Double = 1, headroom: Double? = nil,
    colorSpace: CKColor.ColorSpace = .sRGB
  ) {
    let effectiveHeadroom = (colorSpace == .displayP3) ? headroom : nil
    let converter = CKColor.Converter(
      red: red, green: green, blue: blue, alpha: opacity, headroom: effectiveHeadroom)
    self.init(
      primary: .custom(converter), dark: nil, highContrast: nil, highContrastDark: nil,
      colorSpace: colorSpace)
  }

  @_documentation(visibility: internal)
  public init(model: any CKModel, colorSpace: CKColor.ColorSpace = .sRGB) {
    let rgba = model.rgbRepresentation()
    let effectiveHeadroom = (colorSpace == .displayP3) ? rgba.headroom : nil
    let converter = CKColor.Converter(
      red: rgba.r, green: rgba.g, blue: rgba.b, alpha: rgba.a, headroom: effectiveHeadroom)
    self.init(
      primary: .custom(converter), dark: nil, highContrast: nil, highContrastDark: nil,
      colorSpace: colorSpace)
  }

  @available(iOS 14.0, watchOS 7.0, macOS 11.0, tvOS 14.0, *)
  public init(_ color: Color) {
    self.init(nativeColor: NativeColor(color))
  }

  public init(cgColor: CGColor) {
    #if canImport(AppKit)
      self.init(nativeColor: NativeColor(cgColor: cgColor) ?? .black)
    #else
      self.init(nativeColor: NativeColor(cgColor: cgColor))
    #endif
  }

  #if canImport(CoreImage)
    public init(ciColor: CIColor) {
      self.init(nativeColor: NativeColor(ciColor: ciColor))
    }
  #endif

  public init(nativeColor: NativeColor) {
    let targetSpace: CKColor.ColorSpace

    // 1. Determine Target Space
    let cgColor = nativeColor.cgColor
    if let cgSpace = cgColor.colorSpace {
      if let name = cgSpace.name {
        if name == CGColorSpace.displayP3 {
          targetSpace = .displayP3
        } else if name == CGColorSpace.linearSRGB {
          targetSpace = .sRGBLinear
        } else if name == CGColorSpace.extendedLinearSRGB {
          targetSpace = .extendedLinearSRGB
        } else if name == CGColorSpace.extendedSRGB {
          targetSpace = .extendedSRGB
        } else if name == CGColorSpace.adobeRGB1998 {
          targetSpace = .adobeRGB
        } else if name == CGColorSpace.rommrgb {
          targetSpace = .rommRGB
        } else if name == CGColorSpace.genericLab {
          targetSpace = .lab
        } else if name == CGColorSpace.genericCMYK {
          targetSpace = .cmyk
        } else if (name as String).contains("DeviceRGB") {
          targetSpace = .sRGB
        } else if (name as String).contains("DeviceCMYK") {
          targetSpace = .cmyk
        } else if (name as String).lowercased().contains("displayp3")
          || (name as String).lowercased().contains("p3")
        {
          targetSpace = .displayP3
        } else {
          targetSpace = .sRGB
        }
      } else {
        // Fallback for when name is nil - check model
        let model = cgSpace.model
        if model == .rgb {
          targetSpace = .sRGB
        } else if model == .cmyk {
          targetSpace = .cmyk
        } else if model == .lab {
          targetSpace = .lab
        } else {
          targetSpace = .sRGB
        }
      }
    } else {
      targetSpace = .sRGB
    }

    // Gamut Normalization Logic:
    // We only switch to standard sRGB if the color is in sRGB gamut AND matches a standard name.
    // Otherwise, we preserve the reported targetSpace (e.g., .extendedSRGB).
    var inSrgbGamut = false
    if targetSpace == .sRGB || targetSpace == .sRGBLinear || targetSpace == .extendedLinearSRGB
      || targetSpace == .extendedSRGB || targetSpace == .displayP3
    {
      // Use extendedSRGB here to detect values outside [0, 1] without clamping.
      if let extended = CKColor.Converter(color: nativeColor, in: .extendedSRGB) {
        let c = extended.rgba
        inSrgbGamut =
          c.r >= -0.001 && c.r <= 1.001 && c.g >= -0.001 && c.g <= 1.001 && c.b >= -0.001
          && c.b <= 1.001
      }
    }

    // 2. Fast Path (Standard Color Match)
    // We only hit the registry if it's ACTUALLY a standard sRGB color.
    if inSrgbGamut, let srgbConverter = CKColor.Converter(color: nativeColor, in: .sRGB) {
      if let matchId = Self.hexRegistry[srgbConverter.hex], let instance = CKColor(id: matchId) {
        self = instance
        return
      }
    }

    #if canImport(UIKit)
      let makeDef: (NativeColor) -> ColorDefinition = { color in
        if let converter = CKColor.Converter(color: color, in: targetSpace) {
          return .custom(converter)
        }
        return .custom(CKColor.Converter(red: 0, green: 0, blue: 0, alpha: 1))
      }

      #if os(watchOS)
        // watchOS fallback
        let primary = makeDef(nativeColor)
        self.init(
          primary: primary, dark: nil, highContrast: nil, highContrastDark: nil,
          colorSpace: targetSpace)
        return
      #else
        // UIKit Resolution
        let lightColor = nativeColor.resolvedColor(
          with: UITraitCollection(userInterfaceStyle: .light))
        let darkColor = nativeColor.resolvedColor(
          with: UITraitCollection(userInterfaceStyle: .dark))

        let hcTraits: UITraitCollection
        let hcDarkTraits: UITraitCollection

        if #available(iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *) {
          hcTraits = UITraitCollection(userInterfaceStyle: .light).modifyingTraits { traits in
            traits.accessibilityContrast = .high
          }
          hcDarkTraits = UITraitCollection(userInterfaceStyle: .dark).modifyingTraits { traits in
            traits.accessibilityContrast = .high
          }
        } else {
          hcTraits = UITraitCollection(traitsFrom: [
            .init(userInterfaceStyle: .light), .init(accessibilityContrast: .high),
          ])
          hcDarkTraits = UITraitCollection(traitsFrom: [
            .init(userInterfaceStyle: .dark), .init(accessibilityContrast: .high),
          ])
        }

        let hcColor = nativeColor.resolvedColor(with: hcTraits)
        let hcDarkColor = nativeColor.resolvedColor(with: hcDarkTraits)

        let primary = makeDef(lightColor)
        let dark = (darkColor.cgColor != lightColor.cgColor) ? makeDef(darkColor) : nil
        let hc = (hcColor.cgColor != lightColor.cgColor) ? makeDef(hcColor) : nil
        let hcDark =
          (hcDarkColor.cgColor != lightColor.cgColor && hcDarkColor.cgColor != darkColor.cgColor)
          ? makeDef(hcDarkColor) : nil

        self.init(
          primary: primary, dark: dark, highContrast: hc, highContrastDark: hcDark,
          colorSpace: targetSpace)
        return
      #endif

    #elseif canImport(AppKit)
      // AppKit Resolution
      var primary: ColorDefinition = .custom(CKColor.Converter(red: 0, green: 0, blue: 0, alpha: 1))
      var dark: ColorDefinition? = nil
      var hc: ColorDefinition? = nil
      var hcDark: ColorDefinition? = nil

      let perform: (NativeColor) -> ColorDefinition = { color in
        if let converter = CKColor.Converter(color: color, in: targetSpace) {
          return .custom(converter)
        }
        return .custom(CKColor.Converter(red: 0, green: 0, blue: 0, alpha: 1))
      }

      let performWithAppearance: (NSAppearance.Name, (NativeColor) -> Void) -> Void = {
        name, block in
        if let appearance = NSAppearance(named: name) {
          if #available(macOS 11.0, *) {
            appearance.performAsCurrentDrawingAppearance { block(nativeColor) }
          } else {
            let prev = NSAppearance.current
            NSAppearance.current = appearance
            block(nativeColor)
            NSAppearance.current = prev
          }
        }
      }

      performWithAppearance(.aqua) { primary = perform($0) }
      performWithAppearance(.darkAqua) { c in
        let def = perform(c)
        if def != primary { dark = def }
      }
      performWithAppearance(.accessibilityHighContrastAqua) { c in
        let def = perform(c)
        if def != primary { hc = def }
      }
      performWithAppearance(.accessibilityHighContrastDarkAqua) { c in
        let def = perform(c)
        // Ensure distinctness from both primary and standard dark
        if def != primary && (dark == nil || def != dark!) { hcDark = def }
      }

      self.init(
        primary: primary, dark: dark, highContrast: hc, highContrastDark: hcDark,
        colorSpace: targetSpace)
    #endif
  }
}
