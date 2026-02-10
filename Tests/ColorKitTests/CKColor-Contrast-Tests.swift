#if compiler(>=6.0)
//
//  CKColor-Contrast-Tests.swift
//  ColorKit
//
//  Created by Kamil Szpak on 10/02/2026.
//

import Foundation
import SwiftUI
import Testing

@testable import ColorKit

@Suite("Test CKColor Contrast")
struct CKColorContrastTests {

  let white = CKColor.white
  let black = CKColor.black

  // MARK: - WCAG 2.1 Tests

  @Test("Linear Luminance Precision")
  func testLinearLuminance() {
    #expect(white.linearLuminance >= 0.99)
    #expect(black.linearLuminance == 0.0)

    // Mid-gray (0.5 sRGB) converted to linear is ~0.214
    let gray = CKColor(red: 0.5, green: 0.5, blue: 0.5)
    #expect(gray.linearLuminance > 0.21 && gray.linearLuminance < 0.22)
  }

  @Test("WCAG 2.1 Contrast Ratio")
  func testContrastRatio() {
    // White vs Black should be 21:1
    let ratio = white.contrastRatio(with: black)
    #expect(abs(ratio - 21.0) < 0.1)

    // White vs White should be 1:1
    #expect(white.contrastRatio(with: white) == 1.0)

    // WCAG AA (4.5:1) check
    let gray = CKColor(hexString: "#767676")  // Standard WCAG threshold gray
    #expect(white.contrastRatio(with: gray) >= 4.5)
  }

  // MARK: - APCA (WCAG 3.0) Tests

  @Test("APCA Contrast Calculation")
  func testAPCAContrast() {
    // APCA Lc values
    // White text on Black background
    let lcLightOnDark = white.apcaContrast(on: black)
    #expect(lcLightOnDark > 100.0)  // Typically ~106

    // Black text on White background
    let lcDarkOnLight = black.apcaContrast(on: white)
    #expect(lcDarkOnLight < -100.0)  // Typically ~-108

    // Neutral check
    #expect(white.apcaContrast(on: white) == 0.0)
  }

  @Test("APCA Accessibility Lookup")
  func testAPCAAccessibility() {
    let text = CKColor(hexString: "#aaaaaa")
    let bg = CKColor.white

    // Bold large text should be more accessible than thin small text
    #expect(text.isAPCAAccessible(on: bg, size: 36, weight: .bold))
    #expect(!text.isAPCAAccessible(on: bg, size: 12, weight: .thin))
  }

  @Test("APCA Font Weight Coverage")
  func testFontWeightThresholds() {
    let bg = CKColor.white
    let text = CKColor(hexString: "#555555")

    // This color might pass for bold but fail for thin at same size
    let size: Double = 18
    let passesBold = text.isAPCAAccessible(on: bg, size: size, weight: .bold)
    let passesThin = text.isAPCAAccessible(on: bg, size: size, weight: .thin)

    #expect(passesBold != passesThin || passesBold == true)
  }

  // MARK: - HDR Coverage

  @Test("HDR Linear Luminance")
  func testHDRLuminance() {
    // HDR White with headroom 2.0
    let hdrWhite = CKColor(red: 1, green: 1, blue: 1, headroom: 2.0, colorSpace: .displayP3)
    #expect(hdrWhite.linearLuminance > 1.0)

    // WCAG Luminance must be clamped
    #expect(hdrWhite.wcagLuminance == 1.0)
  }

  @Test("APCA HDR Scaling")
  func testAPCAHDR() {
    let normalWhite = CKColor.white
    let hdrWhite = CKColor(red: 1, green: 1, blue: 1, headroom: 2.0, colorSpace: .displayP3)
    let bg = CKColor.black

    // HDR white on black should have even higher APCA contrast than SDR white
    #expect(hdrWhite.apcaContrast(on: bg) > normalWhite.apcaContrast(on: bg))
  }

  // MARK: - Safety Guards

  @Test("Missing Components Fallback")

  func testLuminanceFallback() {

    // Create a color that fails component resolution

    let ghost = CKColor(
      primary: .standard(name: "not_real"), dark: nil, highContrast: nil, colorSpace: .sRGB)

    // Should fallback to 0.5 in linearLuminance

    #expect(ghost.linearLuminance == 0.5)

  }

  @Test("APCA Silver Thresholds Lookup", arguments: CKColor.FontWeight.allCases)
  func testAPCAThresholdsSilver(for weight: CKColor.FontWeight) {
    let silver = CKAPCA.Thresholds.silver.lookup

    switch weight {
    case .thin, .extraLight:
      #expect(silver(48, weight) == 60)
      #expect(silver(36, weight) == 75)
      #expect(silver(12, weight) == 90)
    case .light:
      #expect(silver(36, weight) == 60)
      #expect(silver(24, weight) == 75)
      #expect(silver(12, weight) == 90)
    case .regular:
      #expect(silver(24, weight) == 60)
      #expect(silver(18, weight) == 75)
      #expect(silver(12, weight) == 90)
    case .medium, .semibold:
      #expect(silver(18, weight) == 60)
      #expect(silver(14, weight) == 75)
      #expect(silver(12, weight) == 85)
    case .bold, .extraBold, .black:
      #expect(silver(14, weight) == 60)
      #expect(silver(12, weight) == 75)
      #expect(silver(10, weight) == 80)
    }
  }
}


#endif
