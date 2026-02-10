#if compiler(>=6.0)
//
//  CKColor-Conversions-Tests.swift
//  ColorKit
//
//  Created by Kamil Szpak on 10/02/2026.
//

import SwiftUI
import Testing

@testable import ColorKit

@Suite("Test CKColor Conversions")
struct CKColorConversionsTests {

  // MARK: - CKColor RGB & Hex

  @Test("CKColor RGB and Hex conversion")
  func testCKColorRGBHex() {
    let color = CKColor(red: 1, green: 0.5, blue: 0, opacity: 1)
    let components = color.rgbComponents()

    #expect(components.r == 1.0)
    #expect(components.g == 0.5)
    #expect(components.b == 0.0)
    #expect(components.a == 1.0)

    #expect(color.hexString == "#ff8000ff")
  }

  @Test("CKColor RGB fallback")
  func testCKColorRGBFallback() {
    // Create a 'ghost' color with nil components
    let ghost = CKColor(
      primary: .standard(name: "nonexistent"), dark: nil, highContrast: nil, colorSpace: .sRGB)
    let components = ghost.rgbComponents()

    // Should fallback to black
    #expect(components.r == 0)
    #expect(components.g == 0)
    #expect(components.b == 0)
    #expect(components.a == 1)
  }

  // MARK: - CKColor Component Getters

  @Test("CKColor Model Component Getters")
  func testCKColorComponentGetters() {
    let color = CKColor.white

    // Generic
    let generic = color.components(as: CKColor.HSL.self)
    #expect(generic.l == 1.0)

    // HSL
    #expect(color.hslComponents().l == 1.0)

    // CMYK
    #expect(color.cmykComponents().k == 0.0)

    // LAB
    #expect(color.labComponents().L >= 99.9)

    // OKLAB
    #expect(color.okLabComponents().L >= 0.99)

    // LCH
    #expect(color.lchComponents().L >= 99.9)
  }

  // MARK: - CKColor Initializers

  @Test("CKColor Model Initializers")
  func testCKColorInitializers() {
    // HSL
    let hsl = CKColor(hue: 0, saturation: 1, lightness: 0.5)
    #expect(hsl.hexString == "#ff0000ff")

    // CMYK
    let cmyk = CKColor(cyan: 1, magenta: 0, yellow: 1, key: 0)  // Green
    #expect(cmyk.hexString == "#00ff00ff")

    // LAB
    let lab = CKColor(L: 100, a: 0, b: 0)
    #expect(lab.hexString == "#ffffffff")

    // OKLAB
    let oklab = CKColor(okL: 1, okA: 0, okB: 0)
    #expect(oklab.hexString == "#ffffffff")

    // LCH
    let lch = CKColor(L: 100, C: 0, h: 0)
    #expect(lch.hexString == "#ffffffff")
  }

  // MARK: - SwiftUI Color Extensions

  @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
  @Test("SwiftUI Color Component Extensions")
  func testSwiftUIColorExtensions() {
    let color = Color.red

    #expect(color.rgbComponents().r > 0.9)
    #expect(color.hexString.hasPrefix("#"))
    #expect(color.hslComponents().s > 0.9)
    #expect(color.cmykComponents().c == 0)
    #expect(color.labComponents().L > 0)
    #expect(color.okLabComponents().L > 0)
    #expect(color.lchComponents().L > 0)

    // Generic
    let generic = color.components(as: CKColor.CMYK.self)
    #expect(generic.m > 0)
  }

  // MARK: - SwiftUI Color Initializers

  @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
  @Test("SwiftUI Color Model Initializers")
  func testSwiftUIColorInitializers() {
    // HSL
    let hsl = Color(hue: 0.5, saturation: 1, lightness: 0.5)
    #expect(CKColor(hsl).hexString == "#00ffffff")

    // CMYK
    let cmyk = Color(cyan: 0, magenta: 1, yellow: 1, key: 0)  // Red
    #expect(CKColor(cmyk).hexString == "#ff0000ff")

    // LAB
    let lab = Color(L: 53, a: 80, b: 67)  // Reddish
    #expect(CKColor(lab).rgbComponents().r > 0.9)

    // OKLAB
    let oklab = Color(okL: 0.6, okA: 0.2, okB: 0.1)
    #expect(CKColor(oklab).rgbComponents().r > 0.5)

    // LCH
    let lch = Color(L: 53, C: 104, h: 40)
    #expect(CKColor(lch).rgbComponents().r > 0.9)
  }
}

#endif
