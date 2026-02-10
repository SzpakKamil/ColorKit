#if compiler(>=6.0)
//
//  CKColor-Core-Tests.swift
//  ColorKit
//
//  Created by Kamil Szpak on 10/02/2026.
//

import Foundation
import SwiftUI
import Testing

@testable import ColorKit

@Suite("CKColor Core Tests")
struct CKColorCoreTests {

  // MARK: - Codable Tests

  @Test("Codable - Standard Color")
  func testStandardColorCodable() throws {
    let red = CKColor.red
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    let data = try encoder.encode(red)
    let decoded = try decoder.decode(CKColor.self, from: data)

    #expect(decoded.id == red.id)
    #expect(decoded.colorSpace == red.colorSpace)
    #expect(decoded.description == red.description)
  }

  @Test("Codable - Custom Dynamic Color")
  func testCustomColorCodable() throws {
    let custom = CKColor(
      hexString: "#FF0000",
      hexStringDark: "#0000FF",
      hexStringHighContrast: "#FFFFFF"
    )

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    let data = try encoder.encode(custom)
    let decoded = try decoder.decode(CKColor.self, from: data)

    #expect(decoded.id == custom.id)
    #expect(decoded.luminance(in: .light) == custom.luminance(in: .light))
    #expect(decoded.luminance(in: .dark) == custom.luminance(in: .dark))
  }

  @Test("Codable - Custom High Contrast Dark")
  func testHighContrastDarkCustomCodable() throws {
    // Create a color with a custom high-contrast dark variant
    let hcDarkHex = "#12345678"
    let color = CKColor(
      hexString: "#000000",
      hexStringHighContrastDark: hcDarkHex
    )

    let encoder = JSONEncoder()
    let decoder = JSONDecoder()

    // Encode
    let data = try encoder.encode(color)

    // Decode
    let decoded = try decoder.decode(CKColor.self, from: data)

    // Verify
    #expect(decoded.highContrastDarkId == hcDarkHex)
    if let comps = decoded.highContrastDarkComponents {
      let hex = CKColor.Converter(rgba: comps).hex
      #expect(hex == hcDarkHex)
    } else {
      Issue.record("Missing highContrastDarkComponents")
    }
  }

  // MARK: - Descriptions & Reflectable

  @Test("Description Protocols")
  func testDescriptions() {
    let red = CKColor.red
    #expect(red.description == "ColorKit.Red")
    #expect(red.debugDescription.contains("CKColor"))

    let custom = CKColor(red: 0.1, green: 0.2, blue: 0.3)
    #expect(custom.description == "ColorKit.CustomColor")
  }

  @Test("Custom Reflectable")
  func testReflection() {
    let red = CKColor.red
    let mirror = red.customMirror

    #expect(mirror.children.contains { $0.label == "id" })
    #expect(mirror.children.contains { $0.label == "colorSpace" })
  }

  // MARK: - Basic Properties

  @Test("Light/Dark Logic")
  func testLightDarkBoolean() {
    #expect(CKColor.white.isLight)
    #expect(!CKColor.white.isDark)
    #expect(CKColor.black.isDark)
    #expect(!CKColor.black.isLight)
  }

  @Test("Opacity Adjustment")
  func testOpacityAdjustment() {
    let red = CKColor.red
    let semi = red.opacity(0.5)

    #expect(semi.rgbComponents().a == 0.5)
    #expect(semi.colorSpace == red.colorSpace)
  }

  @Test("Guard Paths (nil components fallback)")
  func testGuardPaths() {
    // Create a color with a standard name that isn't in the registry to force nil components
    let ghost = CKColor(
      primary: .standard(name: "ghost_identity"),
      dark: nil,
      highContrast: nil,
      highContrastDark: nil,
      colorSpace: .sRGB
    )

    // 1. Test luminance guard path
    #expect(ghost.luminance == 0.5)

    // 2. Test opacity guard path
    let sameGhost = ghost.opacity(0.5)
    #expect(ghost.id == sameGhost.id)
  }

  @Test("Native Resolution - Registry Path")
  func testNativeResolutionRegistryPath() {
    // Use a standard identity that exists in the registry
    let color = CKColor.blue

    // This will trigger resolveNative(from: "blue", ...)
    // The registry branch should be hit first.
    let native = color.nativeColor

    #if canImport(UIKit)
      #if os(watchOS)
      #expect(native == UIColor.blue)
      #else
      #expect(native == UIColor.systemBlue || native == UIColor.blue)
      #endif
    #elseif canImport(AppKit)
      #expect(native == NSColor.systemBlue || native == NSColor.blue)
    #endif
  }

  @Test("Native Resolution - Variant Registry Path")
  func testNativeResolutionVariantRegistryPath() {
    // Bypass the simple registry shortcut in nativeColor getter by adding a variant.
    let color = CKColor(
      hexString: "red",
      hexStringDark: "#000000"
    )

    // On watchOS this hits resolveNative(from: "red", ...)
    // On other platforms it hits resolveNative(from: "resolved", ...) OR registry shortcut
    let native = color.nativeColor

    #if canImport(UIKit) || canImport(AppKit)
      #expect(native != nil)
    #endif
  }

  @Test("High Contrast Standard Components")
  func testHighContrastStandardComponents() {
    // Create a color where HC variants use standard registry names
    let color = CKColor(
      primary: .standard(name: "blue"),
      dark: .standard(name: "white"),
      highContrast: .standard(name: "red"),
      highContrastDark: .standard(name: "yellow"),
      colorSpace: .sRGB
    )

    // Verify internal highContrastComponents access
    let hc = color.highContrastComponents
    let hcd = color.highContrastDarkComponents

    #expect(hc != nil)
    #expect(hcd != nil)

    // Red components: High red, low green/blue
    #expect(hc!.r > 0.9)
    #expect(hc!.g < 0.3)

    // Yellow components: High red, high green, low blue
    #expect(hcd!.r > 0.9)
    #expect(hcd!.g > 0.7)
  }

  @Test("HDR Native Resolution (resolveNative multiplier path)")
  func testHDRNativeResolution() {
    // Create an HDR P3 color which will have multiplier > 1.0
    let hdrColor = CKColor(red: 1.0, green: 1.0, blue: 1.0, headroom: 2.0, colorSpace: .displayP3)

    // This triggers nativeColor -> resolveNative
    let native = hdrColor.nativeColor
    let cgColor = native.cgColor

    // Verify the space name matches one of the expected extended linear spaces
    if let spaceName = cgColor.colorSpace?.name {
      let nameString = spaceName as String
      #expect(
        nameString == (CGColorSpace.extendedLinearDisplayP3 as String)
          || nameString == (CGColorSpace.extendedLinearSRGB as String))
    }

    // Verify components were linearized (White 1.0 at headroom 2.0 -> linear 1.0 * 2.0 = 2.0)
    // Note: sRGB toLinear(1.0) is 1.0.
    if let components = cgColor.components, components.count >= 3 {
      #expect(components[0] >= 1.99)
    }
  }

  @Test(
    "Native Resolution - Color Space Names",
    arguments: [
      CKColor.ColorSpace.sRGBLinear,
      .extendedLinearSRGB,
      .extendedSRGB,
      .adobeRGB,
      .rommRGB,
    ])
  func testNativeResolutionColorSpaces(space: CKColor.ColorSpace) {
    let color = CKColor(red: 0.5, green: 0.5, blue: 0.5, colorSpace: space)
    let native = color.nativeColor

    // This triggers the 'else' branch of 'multiplier > 1.0' and then the 'cgSpaceName' switch
    #if canImport(UIKit) || canImport(AppKit)
      let cgColor = native.cgColor
      #expect(cgColor.colorSpace != nil)
    #endif
  }

  @Test("Native Resolution - Fallback Paths")
  func testNativeResolutionFallbacks() {
    // 1. Test the DisplayP3 vs Default switch at the end of resolveNative
    // We use custom components to bypass the CGColor branch if it were to fail (or just to test the logic)
    let p3Color = CKColor(red: 1.0, green: 0.5, blue: 0.0, colorSpace: .displayP3)
    let nativeP3 = p3Color.nativeColor
    #expect(nativeP3.cgColor.colorSpace != nil)

    let srgbColor = CKColor(red: 1.0, green: 0.5, blue: 0.0, colorSpace: .sRGB)
    let nativeSRGB = srgbColor.nativeColor
    #expect(nativeSRGB.cgColor.colorSpace != nil)
  }

  @Test("Native Resolution - Absolute Fallback")
  func testNativeResolutionAbsoluteFallback() {
    // 2. Test the 'guard let c = components' final fallback (0,0,0,1)
    // This hits the return at the very end of resolveNative.
    let extremeGhost = CKColor(
      primary: .standard(name: "ultimate_ghost"),
      dark: nil,
      highContrast: nil,
      highContrastDark: nil,
      colorSpace: .sRGB
    )
    let blackFallback = extremeGhost.nativeColor
    // Verify it resolved to something valid (black)
    #expect(blackFallback.cgColor.alpha == 1.0)

    let conv = CKColor.Converter(color: blackFallback, in: .sRGB)
    #expect(conv?.hex == "#000000ff")
  }
}

#endif
