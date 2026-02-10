//
//  CKColor-ColorSpaceTypes.swift
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

/// A protocol defining how a color space resolves its components to a standard representation.
public protocol CKGamut {
  /// Resolves the given components to their linearized representation in this gamut.
  func linearRepresentation(for components: CKColor.RGBA) -> CKColor.RGBA
}

/// A protocol for color models that can be converted back and forth from a standard RGBA representation.
public protocol CKModel {
  /// Create the model from standard RGBA components.
  init(from rgba: CKColor.RGBA)
  /// Convert back to standard RGBA components.
  func rgbRepresentation() -> CKColor.RGBA
}

// MARK: - CKColorSpace
extension CKColor {
  public enum ColorSpace: String, Codable, Sendable, CaseIterable, CKGamut {
    /// Standard RGB color space.
    /// Ref: IEC 61966-2-1:1999 "Multimedia systems and equipment - Colour measurement and management - Part 2-1: Colour management - Default RGB colour space - sRGB".
    case sRGB
    /// Linear sRGB color space (sRGB primaries with linear transfer function).
    case sRGBLinear
    /// Extended Linear sRGB color space. Allows values < 0.0 and > 1.0.
    case extendedLinearSRGB
    /// Extended sRGB color space (scRGB). Allows values < 0.0 and > 1.0.
    /// Ref: IEC 61966-2-2:2003.
    case extendedSRGB
    /// Wide gamut Display P3 color space (DCI-P3 primaries, D65 white point, sRGB transfer).
    /// Ref: SMPTE RP 431-2:2011 / Apple Inc.
    case displayP3
    /// Adobe RGB (1998) color space.
    /// Ref: Adobe Systems Incorporated, 2005.
    case adobeRGB
    /// ROMM RGB (ProPhoto RGB) color space.
    /// Ref: ISO 22028-2:2013.
    case rommRGB
    /// HSL color model (represented as sRGB).
    case hsl
    /// CMYK color model (represented as sRGB).
    case cmyk
    /// CIE 1976 L*a*b* color space.
    /// Ref: ISO 11664-4:2008 (CIE S 014-4/E:2007).
    case lab
    /// OKLAB perceptual color space.
    /// Ref: Björn Ottosson, "A perceptual color space for image processing", 2020.
    case okLab
    /// CIE L*C*h° color space (cylindrical representation of CIELAB).
    case lch

    public func linearRepresentation(for components: CKColor.RGBA) -> CKColor.RGBA {
      let multiplier = (self == .displayP3) ? (components.headroom ?? 1.0) : 1.0
      return CKColor.RGBA(
        r: toLinear(components.r) * multiplier,
        g: toLinear(components.g) * multiplier,
        b: toLinear(components.b) * multiplier,
        a: components.a,
        headroom: (self == .displayP3) ? components.headroom : nil
      )
    }

    // MARK: - Unified Transfer Functions
    public func toLinear(_ v: Double) -> Double {
      switch self {
      case .sRGB, .displayP3, .extendedSRGB, .hsl, .cmyk, .lab, .okLab, .lch:
        // IEC 61966-2-1
        let absV = abs(v)
        let val = absV <= 0.04045 ? absV / 12.92 : pow((absV + 0.055) / 1.055, 2.4)
        return v >= 0 ? val : -val

      case .adobeRGB:
        // Gamma 2.19921875 (563/256)
        return v >= 0 ? pow(v, 2.19921875) : -pow(-v, 2.19921875)

      case .rommRGB:
        // ISO 22028-2:2013
        let absV = abs(v)
        let val = absV < 0.031248 ? absV / 16.0 : pow(absV, 1.8)
        return v >= 0 ? val : -val

      case .sRGBLinear, .extendedLinearSRGB:
        return v
      }
    }

    /// Converts a linear light value to gamma-encoded space.
    public func fromLinear(_ v: Double) -> Double {
      switch self {
      case .sRGB, .displayP3, .extendedSRGB, .hsl, .cmyk, .lab, .okLab, .lch:
        // IEC 61966-2-1
        let absV = abs(v)
        let val = absV <= 0.0031308 ? 12.92 * absV : 1.055 * pow(absV, 1.0 / 2.4) - 0.055
        return v >= 0 ? val : -val

      case .adobeRGB:
        return v >= 0 ? pow(v, 1.0 / 2.19921875) : -pow(-v, 1.0 / 2.19921875)

      case .rommRGB:
        let absV = abs(v)
        let val = absV < 0.001953 ? 16.0 * absV : pow(absV, 1.0 / 1.8)
        return v >= 0 ? val : -val

      case .sRGBLinear, .extendedLinearSRGB:
        return v
      }
    }

    // MARK: - Gamut Matrices (Unchanged)
    public struct Matrices {
      static let sRGB_to_XYZ: [Double] = [
        0.4124564, 0.3575761, 0.1804375, 0.2126729, 0.7151522, 0.0721750, 0.0193339, 0.1191920,
        0.9503041,
      ]
      static let XYZ_to_sRGB: [Double] = [
        3.2404542, -1.5371385, -0.4985314, -0.9692660, 1.8760108, 0.0415560, 0.0556434, -0.2040259,
        1.0572252,
      ]
      static let P3_to_XYZ: [Double] = [
        0.4865709, 0.2656677, 0.1982173, 0.2289746, 0.6917385, 0.0792869, 0.0000000, 0.0451134,
        1.0439444,
      ]
    }
  }

  enum ColorDefinition: Hashable, Sendable {
    case standard(name: String)
    case custom(CKColor.Converter)

    var id: String {
      switch self {
      case .standard(let name): return name
      case .custom(let converter): return converter.hex
      }
    }
  }

  public struct RGBA: Hashable, Sendable, Codable, CKModel {
    public let r: Double, g: Double, b: Double, a: Double
    /// The HDR headroom of the color, if applicable.
    public let headroom: Double?

    public init(r: Double, g: Double, b: Double, a: Double, headroom: Double? = nil) {
      self.r = r
      self.g = g
      self.b = b
      self.a = a
      self.headroom = headroom
    }

    public init(from rgba: CKColor.RGBA) {
      self = rgba
    }

    public func rgbRepresentation() -> CKColor.RGBA {
      return self
    }
  }

  public struct HSL: Hashable, Sendable, Codable, CKModel {
    public let h: Double, s: Double, l: Double, a: Double
    public let headroom: Double?

    public init(h: Double, s: Double, l: Double, a: Double = 1.0, headroom: Double? = nil) {
      self.h = h
      self.s = s
      self.l = l
      self.a = a
      self.headroom = headroom
    }

    public init(from rgba: CKColor.RGBA) {
      let r = rgba.r
      let g = rgba.g
      let b = rgba.b
      let maxC = max(r, g, b)
      let minC = min(r, g, b)
      let delta = maxC - minC
      var h: Double = 0
      var s: Double = 0
      let l: Double = (maxC + minC) / 2.0
      if delta != 0 {
        s = l > 0.5 ? delta / (2.0 - maxC - minC) : delta / (maxC + minC)
        if maxC == r {
          h = (g - b) / delta + (g < b ? 6 : 0)
        } else if maxC == g {
          h = (b - r) / delta + 2
        } else {
          h = (r - g) / delta + 4
        }
        h /= 6.0
      }
      self.h = h
      self.s = s
      self.l = l
      self.a = rgba.a
      self.headroom = rgba.headroom
    }

    public func rgbRepresentation() -> CKColor.RGBA {
      let c = (1.0 - abs(2.0 * l - 1.0)) * s
      let x = c * (1.0 - abs((h * 6.0).truncatingRemainder(dividingBy: 2.0) - 1.0))
      let m = l - c / 2.0
      var r: Double = 0
      var g: Double = 0
      var b: Double = 0
      let hueDeg = h * 360.0
      if hueDeg < 60 {
        r = c
        g = x
        b = 0
      } else if hueDeg < 120 {
        r = x
        g = c
        b = 0
      } else if hueDeg < 180 {
        r = 0
        g = c
        b = x
      } else if hueDeg < 240 {
        r = 0
        g = x
        b = c
      } else if hueDeg < 300 {
        r = x
        g = 0
        b = c
      } else {
        r = c
        g = 0
        b = x
      }
      return CKColor.RGBA(r: r + m, g: g + m, b: b + m, a: a, headroom: headroom)
    }
  }

  public struct CMYK: Hashable, Sendable, Codable, CKModel {
    public let c: Double, m: Double, y: Double, k: Double, a: Double
    public let headroom: Double?

    public init(
      c: Double, m: Double, y: Double, k: Double, a: Double = 1.0, headroom: Double? = nil
    ) {
      self.c = c
      self.m = m
      self.y = y
      self.k = k
      self.a = a
      self.headroom = headroom
    }

    public init(from rgba: CKColor.RGBA) {
      let r = rgba.r
      let g = rgba.g
      let b = rgba.b
      let k = 1.0 - max(r, g, b)
      if k == 1.0 {
        self.init(c: 0, m: 0, y: 0, k: 1, a: rgba.a, headroom: rgba.headroom)
      } else {
        let c = (1.0 - r - k) / (1.0 - k)
        let m = (1.0 - g - k) / (1.0 - k)
        let y = (1.0 - b - k) / (1.0 - k)
        self.init(c: c, m: m, y: y, k: k, a: rgba.a, headroom: rgba.headroom)
      }
    }

    public func rgbRepresentation() -> CKColor.RGBA {
      let r = (1.0 - c) * (1.0 - k)
      let g = (1.0 - m) * (1.0 - k)
      let b = (1.0 - y) * (1.0 - k)
      return CKColor.RGBA(r: r, g: g, b: b, a: a, headroom: headroom)
    }
  }

  public struct LAB: Hashable, Sendable, Codable, CKModel {
    public let L: Double, a: Double, b: Double, alpha: Double
    public let headroom: Double?

    public init(L: Double, a: Double, b: Double, alpha: Double = 1.0, headroom: Double? = nil) {
      self.L = L
      self.a = a
      self.b = b
      self.alpha = alpha
      self.headroom = headroom
    }

    public init(from rgba: CKColor.RGBA) {
      // WARNING: Assumes input RGBA is sRGB.
      // Future Improvement: Perform chromatic adaptation if source is P3/AdobeRGB using CKColor.ColorSpace.Matrices.

      let linear = CKColor.ColorSpace.sRGB.linearRepresentation(for: rgba)
      let r = linear.r * 100
      let g = linear.g * 100
      let b = linear.b * 100

      // XYZ Conversion (D65) using sRGB matrix
      let x = r * 0.4124 + g * 0.3576 + b * 0.1805
      let y = r * 0.2126 + g * 0.7152 + b * 0.0722
      let z = r * 0.0193 + g * 0.1192 + b * 0.9505

      let xRef = 95.047
      let yRef = 100.000
      let zRef = 108.883
      var fx = x / xRef
      var fy = y / yRef
      var fz = z / zRef

      // CIELAB f(t) function
      let epsilon = 0.008856
      let kappa = 903.3
      fx = fx > epsilon ? pow(fx, 1.0 / 3.0) : (kappa * fx + 16.0) / 116.0
      fy = fy > epsilon ? pow(fy, 1.0 / 3.0) : (kappa * fy + 16.0) / 116.0
      fz = fz > epsilon ? pow(fz, 1.0 / 3.0) : (kappa * fz + 16.0) / 116.0

      self.L = (116.0 * fy) - 16.0
      self.a = 500.0 * (fx - fy)
      self.b = 200.0 * (fy - fz)
      self.alpha = rgba.a
      self.headroom = rgba.headroom
    }

    public func rgbRepresentation() -> CKColor.RGBA {
      var fy = (L + 16.0) / 116.0
      var fx = a / 500.0 + fy
      var fz = fy - b / 200.0

      let epsilon = 0.008856
      let kappa = 903.3
      let cube = { (v: Double) -> Double in
        let v3 = v * v * v
        return v3 > epsilon ? v3 : (116.0 * v - 16.0) / kappa
      }

      fx = cube(fx)
      fy = cube(fy)
      fz = cube(fz)

      let xRef = 95.047
      let yRef = 100.000
      let zRef = 108.883
      let x = xRef * fx / 100.0
      let y = yRef * fy / 100.0
      let z = zRef * fz / 100.0

      // XYZ -> Linear sRGB
      var r = x * 3.2406 + y * -1.5372 + z * -0.4986
      var g = x * -0.9689 + y * 1.8758 + z * 0.0415
      var b_rgb = x * 0.0557 + y * -0.2040 + z * 1.0570

      // Linear sRGB -> sRGB Gamma
      let gamma = { (v: Double) -> Double in
        v > 0.0031308 ? 1.055 * pow(v, 1.0 / 2.4) - 0.055 : 12.92 * v
      }

      r = gamma(r)
      g = gamma(g)
      b_rgb = gamma(b_rgb)

      return CKColor.RGBA(
        r: max(0, min(1, r)), g: max(0, min(1, g)), b: max(0, min(1, b_rgb)), a: alpha,
        headroom: headroom)
    }
  }

  public struct OKLAB: Hashable, Sendable, Codable, CKModel {
    public let L: Double, a: Double, b: Double, alpha: Double
    public let headroom: Double?

    public init(L: Double, a: Double, b: Double, alpha: Double = 1.0, headroom: Double? = nil) {
      self.L = L
      self.a = a
      self.b = b
      self.alpha = alpha
      self.headroom = headroom
    }

    /// Implementation based on Björn Ottosson's "A perceptual color space for image processing" (2020).
    /// Assumes input `rgba` is in sRGB.
    public init(from rgba: CKColor.RGBA) {
      // 1. Linearize sRGB
      let linear = CKColor.ColorSpace.sRGB.linearRepresentation(for: rgba)
      let r = linear.r
      let g = linear.g
      let b = linear.b

      // 2. Linear sRGB -> LMS (Matrix M1)
      // Source: Ottosson (2020)
      let l_lms = 0.4122214708 * r + 0.5363325363 * g + 0.0514459929 * b
      let m_lms = 0.2119034982 * r + 0.6806995451 * g + 0.1073969566 * b
      let s_lms = 0.0883024619 * r + 0.2817188376 * g + 0.6299787005 * b

      // 3. Non-linear transform (cube root)
      let cbrt = { (v: Double) -> Double in v >= 0 ? pow(v, 1.0 / 3.0) : -pow(-v, 1.0 / 3.0) }
      let l_ = cbrt(l_lms)
      let m_ = cbrt(m_lms)
      let s_ = cbrt(s_lms)

      // 4. LMS' -> OKLAB (Matrix M2)
      self.L = 0.2104542553 * l_ + 0.7936177850 * m_ - 0.0040720468 * s_
      self.a = 1.9779984951 * l_ - 2.4285922050 * m_ + 0.4505937099 * s_
      self.b = 0.0259040371 * l_ + 0.7827717662 * m_ - 0.8086757660 * s_
      self.alpha = rgba.a
      self.headroom = rgba.headroom
    }

    public func rgbRepresentation() -> CKColor.RGBA {
      // 1. OKLAB -> LMS' (Inverse M2)
      let l_ = L + 0.3963377774 * a + 0.2158037573 * b
      let m_ = L - 0.1055613458 * a - 0.0638541728 * b
      let s_ = L - 0.0894841775 * a - 1.2914855480 * b

      // 2. LMS' -> Linear LMS (cube)
      let l_lms = l_ * l_ * l_
      let m_lms = m_ * m_ * m_
      let s_lms = s_ * s_ * s_

      // 3. LMS -> Linear sRGB (Inverse M1)
      var r = +4.0767416621 * l_lms - 3.3077115913 * m_lms + 0.2309699292 * s_lms
      var g = -1.2684380046 * l_lms + 2.6097574011 * m_lms - 0.3413193965 * s_lms
      var bl = -0.0041960863 * l_lms - 0.7034186147 * m_lms + 1.7076147010 * s_lms

      // 4. Linear sRGB -> sRGB (Gamma correction)
      let gamma = { (v: Double) -> Double in
        v > 0.0031308 ? 1.055 * pow(v, 1.0 / 2.4) - 0.055 : 12.92 * v
      }

      r = gamma(r)
      g = gamma(g)
      bl = gamma(bl)

      return CKColor.RGBA(
        r: max(0, min(1, r)), g: max(0, min(1, g)), b: max(0, min(1, bl)), a: alpha,
        headroom: headroom)
    }
  }

  public struct LCH: Hashable, Sendable, Codable, CKModel {
    public let L: Double, C: Double, h: Double, alpha: Double
    public let headroom: Double?

    public init(L: Double, C: Double, h: Double, alpha: Double = 1.0, headroom: Double? = nil) {
      self.L = L
      self.C = C
      self.h = h
      self.alpha = alpha
      self.headroom = headroom
    }

    public init(from rgba: CKColor.RGBA) {
      let lab = CKColor.LAB(from: rgba)
      self.L = lab.L
      self.C = sqrt(pow(lab.a, 2) + pow(lab.b, 2))
      var hue = atan2(lab.b, lab.a) * 180.0 / .pi
      if hue < 0 { hue += 360.0 }
      self.h = hue
      self.alpha = lab.alpha
      self.headroom = lab.headroom
    }

    public func rgbRepresentation() -> CKColor.RGBA {
      let hueRad = h * .pi / 180.0
      let a = C * cos(hueRad)
      let b = C * sin(hueRad)
      let lab = CKColor.LAB(L: L, a: a, b: b, alpha: alpha, headroom: headroom)
      return lab.rgbRepresentation()
    }
  }
}
