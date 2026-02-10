//
//  CKColor-Conversions.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI

// MARK: - RGB & Hex Conversion
extension CKColor {
  /// Returns the RGBA components of the color.
  public func rgbComponents() -> RGBA {
    return components ?? RGBA(r: 0, g: 0, b: 0, a: 1)
  }

  /// Returns the 8-character hex string representation (#RRGGBBAA).
  public var hexString: String {
    let c = rgbComponents()
    return CKColor.Converter(red: c.r, green: c.g, blue: c.b, alpha: c.a).hex
  }
}

// MARK: - Generic Model Support
extension CKColor {
  /// Returns the components of this color in the specified model format.
  public func components<T: CKModel>(as type: T.Type) -> T {
    return Converter.convert(rgba: rgbComponents(), to: T.self)
  }
}

// MARK: - HSL Conversion
extension CKColor {
  public func hslComponents() -> HSL {
    return components(as: HSL.self)
  }
}

// MARK: - CMYK Conversion
extension CKColor {
  public func cmykComponents() -> CMYK {
    return components(as: CMYK.self)
  }
}

// MARK: - LAB Conversion
extension CKColor {
  public func labComponents() -> LAB {
    return components(as: LAB.self)
  }
}

// MARK: - OKLAB Conversion
extension CKColor {
  public func okLabComponents() -> OKLAB {
    return components(as: OKLAB.self)
  }
}

// MARK: - LCH Conversion
extension CKColor {
  public func lchComponents() -> LCH {
    return components(as: LCH.self)
  }
}

// MARK: - SwiftUI.Color Extensions
@available(iOS 14.0, watchOS 7.0, macOS 11.0, tvOS 14.0, *)
extension Color {
  public func rgbComponents() -> CKColor.RGBA {
    return self.ckColor.rgbComponents()
  }

  public var hexString: String {
    return self.ckColor.hexString
  }

  public func components<T: CKModel>(as type: T.Type) -> T {
    return self.ckColor.components(as: type)
  }

  public func hslComponents() -> CKColor.HSL {
    return self.ckColor.hslComponents()
  }

  public func cmykComponents() -> CKColor.CMYK {
    return self.ckColor.cmykComponents()
  }

  public func labComponents() -> CKColor.LAB {
    return self.ckColor.labComponents()
  }

  public func okLabComponents() -> CKColor.OKLAB {
    return self.ckColor.okLabComponents()
  }

  public func lchComponents() -> CKColor.LCH {
    return self.ckColor.lchComponents()
  }
}

// MARK: - Initializers for CKColor
extension CKColor {
  public init(
    hue: Double, saturation: Double, lightness: Double, opacity: Double = 1.0,
    headroom: Double? = nil, colorSpace: CKColor.ColorSpace = .hsl
  ) {
    let model = HSL(h: hue, s: saturation, l: lightness, a: opacity, headroom: headroom)
    self.init(model: model, colorSpace: colorSpace)
  }

  public init(
    cyan: Double, magenta: Double, yellow: Double, key: Double, opacity: Double = 1.0,
    headroom: Double? = nil, colorSpace: CKColor.ColorSpace = .cmyk
  ) {
    let model = CMYK(c: cyan, m: magenta, y: yellow, k: key, a: opacity, headroom: headroom)
    self.init(model: model, colorSpace: colorSpace)
  }

  public init(
    L: Double, a: Double, b: Double, opacity: Double = 1.0, headroom: Double? = nil,
    colorSpace: CKColor.ColorSpace = .lab
  ) {
    let model = LAB(L: L, a: a, b: b, alpha: opacity, headroom: headroom)
    self.init(model: model, colorSpace: colorSpace)
  }

  public init(
    okL: Double, okA: Double, okB: Double, opacity: Double = 1.0, headroom: Double? = nil,
    colorSpace: CKColor.ColorSpace = .okLab
  ) {
    let model = OKLAB(L: okL, a: okA, b: okB, alpha: opacity, headroom: headroom)
    self.init(model: model, colorSpace: colorSpace)
  }

  public init(
    L: Double, C: Double, h: Double, opacity: Double = 1.0, headroom: Double? = nil,
    colorSpace: CKColor.ColorSpace = .lch
  ) {
    let model = LCH(L: L, C: C, h: h, alpha: opacity, headroom: headroom)
    self.init(model: model, colorSpace: colorSpace)
  }
}

// MARK: - SwiftUI.Color Initializers
@available(iOS 14.0, watchOS 7.0, macOS 11.0, tvOS 14.0, *)
extension Color {
  public init(
    hue: Double, saturation: Double, lightness: Double, opacity: Double = 1.0,
    headroom: Double? = nil, colorSpace: CKColor.ColorSpace = .hsl
  ) {
    self =
      CKColor(
        hue: hue, saturation: saturation, lightness: lightness, opacity: opacity,
        headroom: headroom, colorSpace: colorSpace
      ).color
  }

  public init(
    cyan: Double, magenta: Double, yellow: Double, key: Double, opacity: Double = 1.0,
    headroom: Double? = nil, colorSpace: CKColor.ColorSpace = .cmyk
  ) {
    self =
      CKColor(
        cyan: cyan, magenta: magenta, yellow: yellow, key: key, opacity: opacity,
        headroom: headroom, colorSpace: colorSpace
      ).color
  }

  public init(
    L: Double, a: Double, b: Double, opacity: Double = 1.0, headroom: Double? = nil,
    colorSpace: CKColor.ColorSpace = .lab
  ) {
    self =
      CKColor(L: L, a: a, b: b, opacity: opacity, headroom: headroom, colorSpace: colorSpace).color
  }

  public init(
    okL: Double, okA: Double, okB: Double, opacity: Double = 1.0, headroom: Double? = nil,
    colorSpace: CKColor.ColorSpace = .okLab
  ) {
    self =
      CKColor(
        okL: okL, okA: okA, okB: okB, opacity: opacity, headroom: headroom, colorSpace: colorSpace
      ).color
  }

  public init(
    L: Double, C: Double, h: Double, opacity: Double = 1.0, headroom: Double? = nil,
    colorSpace: CKColor.ColorSpace = .lch
  ) {
    self =
      CKColor(L: L, C: C, h: h, opacity: opacity, headroom: headroom, colorSpace: colorSpace).color
  }
}
