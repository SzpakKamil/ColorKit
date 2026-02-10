#if compiler(>=6.0)
//
//  CKColor-Luminance-Tests.swift
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

@Suite("Test CKColor Luminance")
struct CKColorLuminanceTests {
  @Test("SDR Luminance Precision")
  func testSDRLuminance() {
    let white = CKColor.RGBA(r: 1, g: 1, b: 1, a: 1)
    let black = CKColor.RGBA(r: 0, g: 0, b: 0, a: 1)

    // White should result in OKLAB L of 1.0
    #expect(CKColor.Luminance.calculate(for: white, in: .sRGB) >= 0.99)
    // Black should result in OKLAB L of 0.0
    #expect(CKColor.Luminance.calculate(for: black, in: .sRGB) == 0.0)
  }

  @Test("HDR Headroom Preservation for P3 Red")
  func testP3RedHDRLuminance() {

    let baseRed = CKColor.RGBA(r: 1, g: 0, b: 0, a: 1, headroom: 1.0)
    let baseL = CKColor.Luminance.calculate(for: baseRed, in: .displayP3)

    let hdrRed = CKColor.RGBA(r: 1, g: 0, b: 0, a: 1, headroom: 2.0)
    let hdrL = CKColor.Luminance.calculate(for: hdrRed, in: .displayP3)

    #expect(hdrL > baseL, "Headroom should increase the perceptual lightness")
    #expect(hdrL < 1.0, "Boosted red should still be perceptually darker than SDR white")
  }

  @Test("HDR Headroom with Pure White")
  func testWhiteHDRLuminance() {
    let hdrWhite = CKColor.RGBA(r: 1, g: 1, b: 1, a: 1, headroom: 2.0)
    let luminance = CKColor.Luminance.calculate(for: hdrWhite, in: .displayP3)

    #expect(luminance > 1.0, "White with headroom must exceed standard 1.0 lightness")
  }

  @Test("Dynamic Scheme Resolution", arguments: [ColorScheme.light, .dark])
  func testLuminanceByScheme(scheme: ColorScheme) {

    let dynamicColor = CKColor(
      hexString: "#000000",  // Light: Black (L=0)
      hexStringDark: "#FFFFFF"  // Dark: White (L=1)
    )

    let resolvedLuminance = dynamicColor.luminance(in: scheme)

    if scheme == .light {
      #expect(resolvedLuminance < 0.1)
    } else {
      #expect(resolvedLuminance > 0.9)
    }
  }

  @Test("Luminance initialization and default fallback")
  func testLuminanceInit() {
    let color = CKColor.blue
    var provider = CKColor.Luminance(color: color)
    provider._colorSchemeOverride = .light

    let val = provider.wrappedValue
    #expect(val >= 0 && val <= 1.0)
  }

  @Test("Convenience luminance property precision")
  func testLuminanceProperty() {

    let black = CKColor.black
    let white = CKColor.white

    #expect(black.luminance == 0.0, "Black should have 0.0 perceptual luminance")
    #expect(white.luminance >= 0.99, "White should have 1.0 perceptual luminance")

    let gray = CKColor(red: 0.5, green: 0.5, blue: 0.5)
    #expect(gray.luminance > 0.4 && gray.luminance < 0.6)
  }

  @Test("Luminance property uses Primary state only")
  func testLuminanceIgnoresDarkVariant() {
    let dynamicColor = CKColor(
      hexString: "#000000",
      hexStringDark: "#FFFFFF"
    )
    #expect(
      dynamicColor.luminance == 0.0,
      "Convenience luminance should only reflect the primary/light state")
  }

  @Test("Luminance property with Wide Gamut (P3)")
  func testP3LuminanceProperty() {

    let p3Red = CKColor(red: 1.0, green: 0, blue: 0, colorSpace: .displayP3)

    let val = p3Red.luminance
    #expect(val > 0 && val < 1.0)
  }

  @Test("Luminance(in:) dark mode nil-coalescing fallback")
  func testLuminanceDarkModeFallback() {
    // Create a color with only light mode components
    let lightOnly = CKColor(hexString: "#FFFFFF")  // White

    // Resolve luminance in dark mode; it should fall back to white
    let luminance = lightOnly.luminance(in: .dark)
    #expect(luminance >= 0.99)
  }

  @Test("Luminance(in:) guard statement fallback")
  func testLuminanceGuardFallback() {
    // Use the internal initializer to create a color with a non-existent standard name
    // which will result in nil components.
    let definition = CKColor.ColorDefinition.standard(name: "ghost_color_not_in_registry")
    let ghostColor = CKColor(
      primary: definition,
      dark: nil,
      highContrast: nil,
      highContrastDark: nil,
      colorSpace: .sRGB
    )

    // The guard statement should return 0.5
    #expect(ghostColor.luminance(in: .light) == 0.5)
    #expect(ghostColor.luminance(in: .dark) == 0.5)
  }

  @Test("Luminance wrappedValue uses environment when override is nil")
  func testLuminanceEnvironmentFallback() {
    // Create a color where light and dark modes are opposite
    let dynamicColor = CKColor(
      hexString: "#000000",  // Light: Black
      hexStringDark: "#FFFFFF"  // Dark: White
    )

    let provider = CKColor.Luminance(color: dynamicColor)
    // _colorSchemeOverride is nil by default, so it should use the Environment default (usually .light)

    #expect(provider.wrappedValue < 0.1, "Should fall back to environment default (Light/Black)")
  }

  @Test("Luminance wrappedValue fallback for dark mode")
  func testLuminanceWrappedValueFallback() {
    // A color with only light mode definition (no hexStringDark)
    let lightOnlyColor = CKColor(hexString: "#FFFFFF")  // White

    var provider = CKColor.Luminance(color: lightOnlyColor)

    // Test light mode
    provider._colorSchemeOverride = .light
    #expect(provider.wrappedValue >= 0.99)

    // Test dark mode fallback
    provider._colorSchemeOverride = .dark
    // Since darkComponents is nil, it should use color.components (white)
    #expect(provider.wrappedValue >= 0.99)
  }

  @Test("Direct Calculate with non-sRGB spaces")
  func testCalculateNonSRGB() {
    // Test Display P3 Red - should be slightly different from sRGB Red due to wider gamut
    let p3Red = CKColor.RGBA(r: 1.0, g: 0, b: 0, a: 1.0)
    let srgbRed = CKColor.RGBA(r: 1.0, g: 0, b: 0, a: 1.0)

    let p3L = CKColor.Luminance.calculate(for: p3Red, in: .displayP3)
    let srgbL = CKColor.Luminance.calculate(for: srgbRed, in: .sRGB)

    // P3 red is more saturated/intense than sRGB red
    #expect(p3L != srgbL)

    // Test Adobe RGB
    let adobeRed = CKColor.RGBA(r: 1.0, g: 0, b: 0, a: 1.0)
    let adobeL = CKColor.Luminance.calculate(for: adobeRed, in: .adobeRGB)
    #expect(adobeL > srgbL)
  }

  @Test("Calculate conversion resilience and wide-gamut handling")
  func testLuminanceCalculateConversionResilience() {
    // Test with a wide gamut color (Display P3)
    // This exercises the 'else' branch in calculate(for:in:) which performs conversion.
    let p3Red = CKColor.RGBA(r: 1.0, g: 0.0, b: 0.0, a: 1.0)
    let luminance = CKColor.Luminance.calculate(for: p3Red, in: .displayP3)

    // Perceptual luminance of P3 red is ~0.648 in OKLAB L
    #expect(luminance > 0.6 && luminance < 0.7)

    // Test with extreme HDR values to ensure conversion doesn't crash
    let hdrWhite = CKColor.RGBA(r: 1.0, g: 1.0, b: 1.0, a: 1.0, headroom: 5.0)
    let hdrL = CKColor.Luminance.calculate(for: hdrWhite, in: .displayP3)
    #expect(hdrL > 1.0)
  }
}

#endif
