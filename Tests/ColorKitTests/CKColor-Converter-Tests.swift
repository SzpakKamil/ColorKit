#if compiler(>=6.0)
//
//  CKColor-Converter-Tests.swift
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

@Suite("Test CKColor Converter")
struct CKColorConverterTests {

  // MARK: - Hex Normalization & Parsing

  @Test("Hex String Initialization & Normalization")
  func testHexStringInit() {
    // 3-digit hex
    let short = CKColor.Converter("f00")
    #expect(short?.hex == "#ff0000ff")

    // 4-digit hex
    let shortAlpha = CKColor.Converter("#f008")
    #expect(shortAlpha?.hex == "#ff000088")

    // 6-digit hex
    let standard = CKColor.Converter("00ff00")
    #expect(standard?.hex == "#00ff00ff")

    // 8-digit hex
    let standardAlpha = CKColor.Converter("#0000ffff")
    #expect(standardAlpha?.hex == "#0000ffff")

    // Case insensitivity & whitespace
    let messy = CKColor.Converter("  #AaBbCcDd  ")
    #expect(messy?.hex == "#aabbccdd")

    // Invalid strings
    #expect(CKColor.Converter("zztop") == nil)
    #expect(CKColor.Converter("12345") == nil)
    #expect(CKColor.Converter("12") == nil)
  }

  // MARK: - Integer Initialization

  @Test("Integer Initialization")
  func testIntegerInit() {
    // 0xRRGGBB
    let rgb = CKColor.Converter(0xFF0000)
    #expect(rgb.hex == "#ff0000ff")
    #expect(rgb.rgba.r == 1.0)
    #expect(rgb.rgba.a == 1.0)

    // 0xRRGGBBAA
    let val = 0x1122_3380
    let rgba = CKColor.Converter(val)
    #expect(rgba.hex == "#11223380")
    #expect(abs(rgba.rgba.a - 0.5) < 0.01)
  }

  // MARK: - Native Color Extraction

  @Test("Native Color Extraction")
  func testNativeExtraction() {
    #if canImport(UIKit)
      let native = UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)
    #elseif canImport(AppKit)
      let native = NSColor(red: 1, green: 0.5, blue: 0, alpha: 1)
    #endif

    let conv = CKColor.Converter(color: native, in: .sRGB)
    #expect(conv != nil)
    #expect(conv?.rgba.r == 1.0)
    #expect(conv?.rgba.g == 0.5)

    // Wide Gamut Extraction
    #if canImport(UIKit)
      let p3 = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: 1)
    #elseif canImport(AppKit)
      let p3 = NSColor(displayP3Red: 1, green: 0, blue: 0, alpha: 1)
    #endif

    let convP3 = CKColor.Converter(color: p3, in: .displayP3)
    #expect(convP3?.rgba.r == 1.0)
  }

  // MARK: - Generic Model Support

  @Test("Generic Model Conversion Support")
  func testGenericConversion() {
    let rgba = CKColor.RGBA(r: 1, g: 1, b: 1, a: 1)

    // Convert to HSL via static utility
    let hsl = CKColor.Converter.convert(rgba: rgba, to: CKColor.HSL.self)
    #expect(hsl.l == 1.0)

    // Convert back to RGB via static utility
    let back = CKColor.Converter.convertToRGB(model: hsl)
    #expect(back.r == 1.0)
  }

  // MARK: - Component Initialization

  @Test("Component Initialization")
  func testComponentInit() {
    let conv = CKColor.Converter(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4, headroom: 1.5)
    #expect(conv.rgba.r == 0.1)
    #expect(conv.rgba.headroom == 1.5)
  }

  @Test("RGBA Struct Initialization")
  func testRGBAStructInit() {
    let structIn = CKColor.RGBA(r: 0.5, g: 0.5, b: 0.5, a: 1.0)
    let conv = CKColor.Converter(rgba: structIn)
    #expect(conv.rgba.r == 0.5)
  }
}

#endif
