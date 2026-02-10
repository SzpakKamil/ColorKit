#if compiler(>=6.0)
//
//  CKColor-GamutMapping-Tests.swift
//  ColorKit
//
//  Created by Kamil Szpak on 10/02/2026.
//

import Foundation
import SwiftUI
import Testing

@testable import ColorKit

@Suite("Test CKColor Gamut Mapping")
struct CKColorGamutMappingTests {

  // MARK: - Identity & Basic Conversion

  @Test("Identity Conversion")
  func testIdentityConversion() {
    let red = CKColor.red
    let same = red.converted(to: .sRGB)

    #expect(red.colorSpace == same.colorSpace)
    #expect(red.id == same.id)
  }

  @Test("Exhaustive Color Space Conversion", arguments: CKColor.ColorSpace.allCases)
  func testSpaceConversions(for colorSpace: CKColor.ColorSpace) {
    let base = CKColor.red  // sRGB

    let converted = base.converted(to: colorSpace)
    #expect(converted.colorSpace == colorSpace, "Failed to convert to \(colorSpace.rawValue)")

    // Perceptual luminance should remain relatively stable across conversions
    let originalL = base.luminance
    let convertedL = converted.luminance
    #expect(
      abs(originalL - convertedL) < 0.1,
      "Luminance shifted too much converting to \(colorSpace.rawValue)")
  }

  // MARK: - HDR & Extended Range Passthrough

  @Test("HDR Data Preservation")
  func testHDRPassthrough() {
    // Bright white in P3 with headroom
    let hdrColor = CKColor(red: 1.0, green: 1.0, blue: 1.0, headroom: 2.0, colorSpace: .displayP3)

    // Convert to Extended sRGB (should preserve the > 1.0 energy)
    let extended = hdrColor.converted(to: .extendedSRGB)

    #expect(extended.colorSpace == .extendedSRGB)
    #expect(extended.rgbComponents().r >= 1.0)
    #expect(extended.rgbComponents().headroom == 2.0)
  }

  // MARK: - Perceptual Gamut Mapping

  @Test("Out-of-Gamut Perceptual Mapping")
  func testPerceptualMapping() {
    // Pure P3 Red (1, 0, 0) is outside sRGB gamut
    let p3Red = CKColor(red: 1.0, green: 0.0, blue: 0.0, colorSpace: .displayP3)

    // Convert to sRGB
    let srgbRed = p3Red.converted(to: .sRGB, iterations: 10)

    #expect(srgbRed.colorSpace == .sRGB)

    let components = srgbRed.rgbComponents()
    // Components must be within [0, 1] for sRGB
    #expect(components.r >= 0.0 && components.r <= 1.0)
    #expect(components.g >= 0.0 && components.g <= 1.0)
    #expect(components.b >= 0.0 && components.b <= 1.0)

    // Perceptual check: It should still be a very strong red
    #expect(components.r > 0.9)
    #expect(components.g < 0.2)
  }

  // MARK: - Mathematical Backend (XYZ)

  @Test("XYZ Round-trip consistency")
  func testXYZConsistency() {
    // Manual access to internal mapping (via converted to self which hits code paths)
    // Testing the underlying math used by conversion
    let p3 = CKColor(red: 0.5, green: 0.5, blue: 0.5, colorSpace: .sRGB).converted(to: .displayP3)
    let back = p3.converted(to: .sRGB)

    #expect(abs(back.rgbComponents().r - 0.5) < 0.01)
  }

  // MARK: - Dynamic State Preservation

  @Test("Dynamic State Preservation during Conversion")
  func testDynamicConversion() {
    let dynamic = CKColor(
      hexString: "#000000",  // Light: Black
      hexStringDark: "#FFFFFF",  // Dark: White
      hexStringHighContrast: "#333333",
      hexStringHighContrastDark: "#CCCCCC"
    )

    let p3Dynamic = dynamic.converted(to: .displayP3)

    // Check light state
    #expect(p3Dynamic.luminance(in: .light) < 0.1)
    // Check dark state (should have been converted from White)
    #expect(p3Dynamic.luminance(in: .dark) > 0.9)

    // Check High Contrast states (the hcDef / hcdDef paths)
    #expect(p3Dynamic.highContrastId != nil)
    #expect(p3Dynamic.highContrastDarkId != nil)
  }

  @Test("Iterative Mapping Reduction Branch")
  func testIterativeReduction() {
    // To trigger 'maxChroma = midChroma', we need a color that is so far out of gamut
    // that even at 50% chroma reduction it still doesn't fit.
    // Pure Ultra-Red in P3 (1, 0, 0) converted to sRGB is already out of gamut.
    // We'll use an even more extreme value to ensure the 'else' branch is hit.
    let extremeOut = CKColor(red: 2.0, green: -1.0, blue: -1.0, colorSpace: .displayP3)

    // Converting this to sRGB will definitely require chroma reduction.
    // Since the starting midChroma is 0.5, an extreme color will likely
    // still be out of gamut at that point, triggering the 'maxChroma = midChroma' branch.
    let srgb = extremeOut.converted(to: .sRGB, iterations: 10)

    #expect(srgb.colorSpace == .sRGB)
    let comps = srgb.rgbComponents()
    #expect(comps.r >= 0 && comps.r <= 1.0)
    #expect(comps.g >= 0 && comps.g <= 1.0)
    #expect(comps.b >= 0 && comps.b <= 1.0)
  }

  // MARK: - Edge Cases

  @Test("Nil components fallback")
  func testNilComponentsConversion() {
    // Force a 'ghost' color with nil components
    let ghost = CKColor(
      primary: .standard(name: "missing"), dark: nil, highContrast: nil, colorSpace: .sRGB)

    let converted = ghost.converted(to: .displayP3)
    #expect(converted.colorSpace == .displayP3)
    // Should fallback to black
    #expect(converted.rgbComponents().r == 0)
  }
}

#endif
