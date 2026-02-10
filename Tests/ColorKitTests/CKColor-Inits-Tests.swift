#if compiler(>=6.0)
//
//  CKColor-Inits-Tests.swift
//  ColorKit
//
//  Created by Kamil Szpak on 10/02/2026.
//

import SwiftUI
import Testing

@testable import ColorKit

#if canImport(CoreImage)
  import CoreImage
#endif
#if canImport(UIKit)
  import UIKit
#elseif canImport(AppKit)
  import AppKit
#endif

@Suite("Test CKColor Inits")
struct CKColorInitsTests {

  // MARK: - Hex String Initializers

  @Test("Hex String Initializer - Standard Names")
  func testHexStringStandardNames() {
    let red = CKColor(hexString: "red")
    #expect(red.id.primary != 0)
    #expect(CKColor.isStandardName("red"))

    let mixed = CKColor(hexString: "blue", hexStringDark: "white")
    #expect(mixed.darkId == "white")
  }

  @Test("Hex String Initializer - Hex Values")
  func testHexStringValues() {
    let hex = CKColor(hexString: "#FF0000")
    #expect(hex.rgbComponents().r == 1.0)

    let invalid = CKColor(hexString: "not-a-color")
    #expect(invalid.rgbComponents().r == 0.0)  // Fallback to black
  }

  // MARK: - Hex Integer Initializers

  @Test("Hex Integer Initializer")
  func testHexIntInits() {
    // 6-digit
    let rgb = CKColor(hexInt: 0x00FF00)
    #expect(rgb.rgbComponents().g == 1.0)

    // 8-digit
    let rgba = CKColor(hexInt: 0xFF00_0080)
    #expect(abs(rgba.rgbComponents().a - 0.5) < 0.01)

    // Dynamic
    let dynamic = CKColor(hexInt: 0x000000, hexIntDark: 0xFFFFFF)
    #expect(dynamic.luminance(in: .light) < 0.01)
    #expect(abs(dynamic.luminance(in: .dark) - 1.0) < 0.01)
  }

  // MARK: - Component Initializers

  @Test("Component Initializer")
  func testComponentInits() {
    let p3 = CKColor(red: 1, green: 0, blue: 0, opacity: 0.5, headroom: 1.2, colorSpace: .displayP3)
    #expect(p3.colorSpace == .displayP3)
    #expect(p3.rgbComponents().headroom == 1.2)

    // sRGB ignores headroom
    let srgb = CKColor(red: 1, green: 0, blue: 0, headroom: 1.2, colorSpace: .sRGB)
    #expect(srgb.rgbComponents().headroom == nil)
  }

  // MARK: - Model Initializers

  @Test("Model Initializer")

  func testModelInits() {

    let hsl = CKColor.HSL(h: 0, s: 1, l: 0.5)

    let color = CKColor(model: hsl)

    #expect(color.hexString == "#ff0000ff")

    // Test effectiveHeadroom logic

    let modelWithHeadroom = CKColor.RGBA(r: 1, g: 1, b: 1, a: 1, headroom: 2.5)

    // Case 1: displayP3 should preserve headroom

    let p3Headroom = CKColor(model: modelWithHeadroom, colorSpace: .displayP3)

    #expect(p3Headroom.rgbComponents().headroom == 2.5)

    // Case 2: sRGB should discard headroom (nil)

    let srgbNoHeadroom = CKColor(model: modelWithHeadroom, colorSpace: .sRGB)

    #expect(srgbNoHeadroom.rgbComponents().headroom == nil)

  }

  // MARK: - Composite Initializers

  @Test("Composite Dynamic Initializer")

  func testCompositeInits() {

    let light = CKColor.white

    let dark = CKColor.black

    let highContrast = CKColor(red: 0.8, green: 0.8, blue: 0.8)

    let highContrastDark = CKColor(red: 0.2, green: 0.2, blue: 0.2)

    // Full variant creation

    let full = CKColor(

      light: light,

      dark: dark,

      highContrast: highContrast,

      highContrastDark: highContrastDark

    )

    #expect(abs(full.luminance(in: .light) - 1.0) < 0.01)

    #expect(full.luminance(in: .dark) < 0.01)

    #expect(full.highContrastId != nil)

    #expect(full.highContrastDarkId != nil)

    // Test alignment logic: Convert mismatched space components

    let lightP3 = CKColor(red: 1, green: 0, blue: 0, colorSpace: .displayP3)

    let compositeSRGB = CKColor(

      light: lightP3,

      dark: dark,

      highContrast: highContrast,

      highContrastDark: highContrastDark,

      colorSpace: .sRGB

    )

    #expect(compositeSRGB.colorSpace == .sRGB)

    // Light variant should have been converted from P3(1,0,0) to sRGB

    // P3(1,0,0) is out of sRGB gamut, so it will be mapped/clamped.

    let lightComps = compositeSRGB.rgbComponents()

    #expect(lightComps.r > 0.9)

  }

  // MARK: - Native Bridge Initializers
  @Test("Native Color Bridge Detection")

  func testNativeBridgeInits() {
    #if os(watchOS)
      let native = NativeColor.red
    #else
      let native = NativeColor.systemRed
    #endif
    let ck = CKColor(nativeColor: native)
    // Should hit fast path for standard system colors
    #expect(ck.description.contains("Red"))
    let customNative = NativeColor(red: 0.123, green: 0.456, blue: 0.789, alpha: 1)
    let ckCustom = CKColor(nativeColor: customNative)
    #expect(abs(ckCustom.rgbComponents().r - 0.123) < 0.01)
  }

  @Test("CGColor and CIColor Inits")
  func testCoreGraphicsImageInits() {
    let cg = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
    let ckcg = CKColor(cgColor: cg)
    #expect(ckcg.rgbComponents().r == 1.0)
    #if canImport(CoreImage)
      let ci = CIColor(red: 0, green: 1, blue: 0)
      let ckci = CKColor(ciColor: ci)
      #expect(ckci.rgbComponents().g == 1.0)
    #endif

  }

  @available(iOS 14.0, watchOS 7.0, macOS 11.0, tvOS 14.0, *)
  @Test("SwiftUI Color Init")
  func testSwiftUIInit() {
    let color = Color.blue
    let ck = CKColor(color)
      #if os(watchOS)
      #expect(ck.description.contains("Custom"))
      #else
      #expect(ck.description.contains("Blue"))
      #endif
  }

  // MARK: - Gamut Normalization Logic
  @Test("Gamut Normalization Logic")
  func testGamutNormalization() {
    // Create a P3 color that is actually within sRGB gamut (Grey)
    // Use a value that is UNLIKELY to match a standard color exactly
    let greyP3 = NativeColor(displayP3Red: 0.51, green: 0.51, blue: 0.51, alpha: 1.0)
    let ck = CKColor(nativeColor: greyP3)

    // On macOS/watchOS/iOS, it should NOT have been normalized to sRGB because it doesn't match a standard name.
    // We preserve the wide-gamut intent for custom colors.
    #if os(macOS)
      #expect(ck.colorSpace == .displayP3)
    #else
      #expect(ck.colorSpace == .displayP3 || ck.colorSpace == .extendedSRGB)
    #endif

    // Create a P3 color that is WIDE gamut
    let wideP3 = NativeColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    let ckWide = CKColor(nativeColor: wideP3)

    // It should stay in wide gamut (DisplayP3 or ExtendedSRGB depending on OS)
    #if os(macOS)
      #expect(ckWide.colorSpace == .displayP3)
    #else
      #expect(ckWide.colorSpace == .displayP3 || ckWide.colorSpace == .extendedSRGB)
    #endif
  }
}


#endif
