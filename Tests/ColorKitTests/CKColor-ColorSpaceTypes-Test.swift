#if compiler(>=6.0)
//
//  CKColor-ColorSpaceTypes-Test.swift
//  ColorKit
//
//  Created by Kamil Szpak on 10/02/2026.
//

import CoreGraphics
import SwiftUI
import Testing

@testable import ColorKit

#if canImport(UIKit)
  import UIKit
#elseif canImport(AppKit)
  import AppKit
#endif

@Suite("Test CKColor ColorSpaceTypes")
struct CKColorColorSpaceTypesTests {

  // MARK: - Parameterized Name Detection

  struct SpaceTestCase: CustomStringConvertible, Sendable {
    let name: String
    let expected: CKColor.ColorSpace
    var description: String { name }
  }

  @Test(
    "Detect Space by CGColorSpace Name",
    arguments: [
      SpaceTestCase(name: CGColorSpace.displayP3 as String, expected: .displayP3),
      SpaceTestCase(name: CGColorSpace.linearSRGB as String, expected: .sRGBLinear),
      SpaceTestCase(name: CGColorSpace.extendedLinearSRGB as String, expected: .extendedLinearSRGB),
      SpaceTestCase(name: CGColorSpace.extendedSRGB as String, expected: .extendedSRGB),
      SpaceTestCase(name: CGColorSpace.adobeRGB1998 as String, expected: .adobeRGB),
      SpaceTestCase(name: CGColorSpace.rommrgb as String, expected: .rommRGB),
      SpaceTestCase(name: CGColorSpace.genericLab as String, expected: .lab),
      SpaceTestCase(name: CGColorSpace.genericCMYK as String, expected: .cmyk),
      SpaceTestCase(name: CGColorSpace.sRGB as String, expected: .sRGB),
    ])
  func testNameDetection(testCase: SpaceTestCase) {
    guard let cgSpace = CGColorSpace(name: testCase.name as CFString) else { return }

    // Use components that won't trigger standard color matching
    let components: [CGFloat]
    switch cgSpace.model {
    case .cmyk: components = [0.1, 0.2, 0.3, 0.4, 1.0]
    case .lab: components = [50, 10, 10, 1.0]
    default: components = [0.123, 0.456, 0.789, 1.0]
    }

    guard let cgColor = CGColor(colorSpace: cgSpace, components: components) else { return }

    #if canImport(AppKit)
      let native = NativeColor(cgColor: cgColor) ?? .black
    #else
      let native = NativeColor(cgColor: cgColor)
    #endif

    let ck = CKColor(nativeColor: native)
    #expect(ck.colorSpace == testCase.expected)
  }

  // MARK: - Model Fallback Detection

  @Test("Detect Space by CGColorSpace Model (Fallback)")
  func testModelFallback() {
    // Device spaces often have nil names or names that don't match the specific string constants
    let testCases: [(CGColorSpace, CKColor.ColorSpace)] = [
      (CGColorSpaceCreateDeviceRGB(), .sRGB),
      (CGColorSpaceCreateDeviceCMYK(), .cmyk),
    ]

    for (cgSpace, expected) in testCases {
      let components: [CGFloat] =
        cgSpace.model == .cmyk ? [0.1, 0.2, 0.3, 0.4, 1.0] : [0.123, 0.456, 0.789, 1.0]
      guard let cgColor = CGColor(colorSpace: cgSpace, components: components) else { continue }

      #if canImport(AppKit)
        let native = NativeColor(cgColor: cgColor) ?? .black
      #else
        let native = NativeColor(cgColor: cgColor)
      #endif

      let ck = CKColor(nativeColor: native)

      // If the system gave it a name, it might have hit the name branch, which is fine.
      // If it had no name, it must hit the model branch.
      #expect(ck.colorSpace == expected)
    }
  }

  // MARK: - Transfer Functions & Gamut Math

  @Test("ColorSpace Linear Transfer Consistency", arguments: CKColor.ColorSpace.allCases)
  func testTransferFunctions(space: CKColor.ColorSpace) {
    let values: [Double] = [0.0, 0.2, 0.5, 0.8, 1.0]

    for v in values {
      let linear = space.toLinear(v)
      let back = space.fromLinear(linear)
      #expect(abs(v - back) < 0.001, "Failed round-trip for \(space) at \(v)")
    }
  }

  @Test("Display P3 Headroom Multiplier")
  func testP3HeadroomLinearization() {
    let components = CKColor.RGBA(r: 1.0, g: 1.0, b: 1.0, a: 1.0, headroom: 2.0)

    // P3 should apply the multiplier
    let p3Linear = CKColor.ColorSpace.displayP3.linearRepresentation(for: components)
    #expect(p3Linear.r > 1.0)
    #expect(p3Linear.headroom == 2.0)

    // sRGB should NOT apply the multiplier
    let srgbLinear = CKColor.ColorSpace.sRGB.linearRepresentation(for: components)
    #expect(srgbLinear.r <= 1.0)
    #expect(srgbLinear.headroom == nil)
  }

  // MARK: - Color Model Round-trips

  @Test("HSL Model Round-trip")
  func testHSLRoundTrip() {
    let red = CKColor.RGBA(r: 1, g: 0, b: 0, a: 1)
    let hsl = CKColor.HSL(from: red)
    #expect(hsl.h == 0)
    #expect(hsl.s == 1)
    #expect(hsl.l == 0.5)

    let back = hsl.rgbRepresentation()
    #expect(back.r == 1 && back.g == 0 && back.b == 0)
  }

  @Test("CMYK Model Round-trip")
  func testCMYKRoundTrip() {
    let cyan = CKColor.RGBA(r: 0, g: 1, b: 1, a: 1)
    let cmyk = CKColor.CMYK(from: cyan)
    #expect(cmyk.c == 1 && cmyk.m == 0 && cmyk.y == 0 && cmyk.k == 0)

    let back = cmyk.rgbRepresentation()
    #expect(abs(back.r - 0) < 0.001)
    #expect(back.g == 1 && back.b == 1)
  }

  @Test("LAB Model Round-trip")
  func testLABRoundTrip() {
    let white = CKColor.RGBA(r: 1, g: 1, b: 1, a: 1)
    let lab = CKColor.LAB(from: white)
    #expect(lab.L >= 99.9)

    let back = lab.rgbRepresentation()
    #expect(back.r > 0.99 && back.g > 0.99 && back.b > 0.99)
  }

  @Test("OKLAB Model Round-trip")
  func testOKLABRoundTrip() {
    let gray = CKColor.RGBA(r: 0.5, g: 0.5, b: 0.5, a: 1)
    let oklab = CKColor.OKLAB(from: gray)

    let back = oklab.rgbRepresentation()
    #expect(abs(back.r - 0.5) < 0.001)
  }

  @Test("LCH Model Round-trip")
  func testLCHRoundTrip() {
    let blue = CKColor.RGBA(r: 0, g: 0, b: 1, a: 1)
    let lch = CKColor.LCH(from: blue)

    let back = lch.rgbRepresentation()
    #expect(abs(back.b - 1.0) < 0.001)
  }

  // MARK: - Color Definition

  @Test("ColorDefinition Identity")
  func testDefinitionIdentity() {
    let standard = CKColor.ColorDefinition.standard(name: "red")
    #expect(standard.id == "red")

    let custom = CKColor.ColorDefinition.custom(CKColor.Converter(0xFF0000))
    #expect(custom.id == "#ff0000ff")
  }
}

#endif
