//
//  CKColor-Converter.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI

#if canImport(UIKit)
  import UIKit
#elseif canImport(AppKit)
  import AppKit
#endif

extension CKColor {
  /// A centralized utility for color format conversions and normalization.
    struct Converter: Sendable, Equatable, Hashable {

    // MARK: - Properties

    /// The normalized 8-character hex string (e.g., "#ff0000ff").
    var hex: String {
      let f = { (v: Double) in Int(round(min(max(v, 0), 1) * 255)) }
      return String(format: "#%02x%02x%02x%02x", f(rgba.r), f(rgba.g), f(rgba.b), f(rgba.a))
    }

    /// The color components.
    let rgba: CKColor.RGBA

    // MARK: - Initializers

    /// Initializes directly from an RGBA struct.
    /// (Required because other custom inits suppress the default memberwise init).
    init(rgba: CKColor.RGBA) {
      self.rgba = rgba
    }

    /// Initializes from a string, normalizing it. Returns nil if the string is invalid.
    init?(_ string: String) {
      guard let normalized = Self.normalize(hex: string),
        let components = Self.parseHex(normalized)
      else { return nil }
      self.rgba = components
    }

    /// Initializes from RGBA components.
    init(red: Double, green: Double, blue: Double, alpha: Double, headroom: Double? = nil) {
      self.rgba = CKColor.RGBA(r: red, g: green, b: blue, a: alpha, headroom: headroom)
    }

    /// Initializes from an integer value (0xRRGGBB or 0xRRGGBBAA).
    init(_ value: Int) {
      let r: Double
      let g: Double
      let b: Double
      let a: Double
      if value > 0xFFFFFF || value < 0 {
        // Assume 0xRRGGBBAA (even if R is 0, we can't be sure unless we check caller intent,
        // but usually values > 0xFFFFFF are definitely 8-digit).
        // Actually, a better check might be needed, but for now we follow the 0xFFFFFF logic.
        r = Double((value >> 24) & 0xFF) / 255.0
        g = Double((value >> 16) & 0xFF) / 255.0
        b = Double((value >> 8) & 0xFF) / 255.0
        a = Double(value & 0xFF) / 255.0
      } else {
        r = Double((value >> 16) & 0xFF) / 255.0
        g = Double((value >> 8) & 0xFF) / 255.0
        b = Double(value & 0xFF) / 255.0
        a = 1.0
      }
      self.rgba = CKColor.RGBA(r: r, g: g, b: b, a: a)
    }

    /// Initializes from a native color in a specific color space.
    init?(color: NativeColor, in space: CKColor.ColorSpace) {
      guard let comps = Self.extractComponents(from: color, in: space) else { return nil }
      self.rgba = CKColor.RGBA(
        r: Double(comps.r), g: Double(comps.g), b: Double(comps.b), a: Double(comps.a))
    }

    // MARK: - Generic Format Conversions

    /// Converts RGBA components to the specified CKModel type.
    static func convert<T: CKModel>(rgba: CKColor.RGBA, to type: T.Type) -> T {
      return T(from: rgba)
    }

    /// Converts a CKModel back to RGBA components.
    static func convertToRGB<T: CKModel>(model: T) -> CKColor.RGBA {
      return model.rgbRepresentation()
    }

    // MARK: - Internal Helpers (Hex & Components)

    private static func normalize(hex: String) -> String? {
      var clean = hex.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
      if clean.hasPrefix("#") { clean.removeFirst() }
      guard clean.allSatisfy({ $0.isHexDigit }) else { return nil }
      switch clean.count {
      case 3:
        let r = clean[clean.startIndex]
        let g = clean[clean.index(clean.startIndex, offsetBy: 1)]
        let b = clean[clean.index(clean.startIndex, offsetBy: 2)]
        return "#\(r)\(r)\(g)\(g)\(b)\(b)ff"
      case 4:
        let r = clean[clean.startIndex]
        let g = clean[clean.index(clean.startIndex, offsetBy: 1)]
        let b = clean[clean.index(clean.startIndex, offsetBy: 2)]
        let a = clean[clean.index(clean.startIndex, offsetBy: 3)]
        return "#\(r)\(r)\(g)\(g)\(b)\(b)\(a)\(a)"
      case 6: return "#" + clean + "ff"
      case 8: return "#" + clean
      default: return nil
      }
    }

    private static func parseHex(_ hex: String) -> CKColor.RGBA? {
      var hexClean = hex
      if hexClean.hasPrefix("#") { hexClean.removeFirst() }
      guard let int = UInt64(hexClean, radix: 16) else { return nil }
      return CKColor.RGBA(
        r: Double((int >> 24) & 0xFF) / 255.0, g: Double((int >> 16) & 0xFF) / 255.0,
        b: Double((int >> 8) & 0xFF) / 255.0, a: Double(int & 0xFF) / 255.0)
    }

    private static func extractComponents(from color: NativeColor, in space: CKColor.ColorSpace)
      -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat)?
    {
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
      guard let targetSpace = CGColorSpace(name: cgSpaceName) else { return nil }
      var r: CGFloat = 0
      var g: CGFloat = 0
      var b: CGFloat = 0
      var a: CGFloat = 0
      #if canImport(UIKit)
        let finalCGColor: CGColor
        if color.cgColor.colorSpace?.name == cgSpaceName {
          finalCGColor = color.cgColor
        } else if let converted = color.cgColor.converted(
          to: targetSpace, intent: .defaultIntent, options: nil)
        {
          finalCGColor = converted
        } else {
          return nil
        }
        guard let comps = finalCGColor.components, comps.count >= 3 else { return nil }
        r = comps[0]
        g = comps[1]
        b = comps[2]
        a = finalCGColor.alpha
      #elseif canImport(AppKit)
        let nsSpace: NSColorSpace? = {
          switch space {
          case .sRGB, .hsl, .cmyk, .lab, .okLab, .lch: return .sRGB
          case .displayP3: return .displayP3
          case .adobeRGB: return .adobeRGB1998
          default: return NSColorSpace(cgColorSpace: targetSpace)
          }
        }()
        if let nsSpace, let converted = color.usingColorSpace(nsSpace) {
          converted.getRed(&r, green: &g, blue: &b, alpha: &a)
        } else {
          let finalCGColor: CGColor
          if color.cgColor.colorSpace?.name == cgSpaceName {
            finalCGColor = color.cgColor
          } else if let converted = color.cgColor.converted(
            to: targetSpace, intent: .defaultIntent, options: nil)
          {
            finalCGColor = converted
          } else {
            return nil
          }
          guard let comps = finalCGColor.components, comps.count >= 3 else { return nil }
          r = comps[0]
          g = comps[1]
          b = comps[2]
          a = finalCGColor.alpha
        }
      #endif
      return (r, g, b, a)
    }
  }
}
