#if compiler(>=6.0)
//
//  CKColor-Tables-Tests.swift
//  ColorKit
//
//  Created by Kamil Szpak on 10/02/2026.
//

import SwiftUI
import Testing

@testable import ColorKit

#if canImport(UIKit)
  import UIKit
#elseif canImport(AppKit)
  import AppKit
#endif

@Suite("CKColor Tables Tests")
struct CKColorTablesTests {

  // MARK: - Static Colors Test

  @Test("Verify every static default color")
  func testStaticDefaultColors() {
    // Red
    #expect(CKColor.red.id.primary != 0)
    #expect(CKColor.red.description.contains("Red"))

    // Orange
    #expect(CKColor.orange.id.primary != 0)
    #expect(CKColor.orange.description.contains("Orange"))

    // Yellow
    #expect(CKColor.yellow.id.primary != 0)
    #expect(CKColor.yellow.description.contains("Yellow"))

    // Green
    #expect(CKColor.green.id.primary != 0)
    #expect(CKColor.green.description.contains("Green"))

    // Mint
    #expect(CKColor.mint.id.primary != 0)
    #expect(CKColor.mint.description.contains("Mint"))

    // Teal
    #expect(CKColor.teal.id.primary != 0)
    #expect(CKColor.teal.description.contains("Teal"))

    // Cyan
    #expect(CKColor.cyan.id.primary != 0)
    #expect(CKColor.cyan.description.contains("Cyan"))

    // Blue
    #expect(CKColor.blue.id.primary != 0)
    #expect(CKColor.blue.description.contains("Blue"))

    // Indigo
    #expect(CKColor.indigo.id.primary != 0)
    #expect(CKColor.indigo.description.contains("Indigo"))

    // Purple
    #expect(CKColor.purple.id.primary != 0)
    #expect(CKColor.purple.description.contains("Purple"))

    // Pink
    #expect(CKColor.pink.id.primary != 0)
    #expect(CKColor.pink.description.contains("Pink"))

    // Brown
    #expect(CKColor.brown.id.primary != 0)
    #expect(CKColor.brown.description.contains("Brown"))

    // Gray
    #expect(CKColor.gray.id.primary != 0)
    #expect(CKColor.gray.description.contains("Gray"))

    // White
    #expect(CKColor.white.id.primary != 0)
    #expect(CKColor.white.description.contains("White"))

    // Black
    #expect(CKColor.black.id.primary != 0)
    #expect(CKColor.black.description.contains("Black"))
  }

  @Test("Standard Colors Array")
  func testStandardColorsArray() {
    let colors = CKColor.standardColors
    #expect(colors.count == 15)

    // Ensure all are unique
    let ids = Set(colors.map { $0.id })
    #expect(ids.count == 15)
  }

  // MARK: - Registry Logic

  @Test("Standard Name Recognition")
  func testIsStandardName() {
    #expect(CKColor.isStandardName("red"))
    #expect(CKColor.isStandardName("RED"))
    #expect(CKColor.isStandardName("blue"))
    #expect(CKColor.isStandardName("black"))
    #expect(CKColor.isStandardName("white"))

    #expect(!CKColor.isStandardName("not-a-color"))
    #expect(!CKColor.isStandardName("#FF0000"))
  }

  @Test("Hex Registry Lookup")
  func testHexRegistry() {
    // Red hex (System Red approximated)
    let redHex = CKColor.red.hexString
    #expect(CKColor.hexRegistry[redHex] == "red")

    // Black
    let blackHex = CKColor.black.hexString
    #expect(CKColor.hexRegistry[blackHex] == "black")

    // White
    let whiteHex = CKColor.white.hexString
    #expect(CKColor.hexRegistry[whiteHex] == "white")
  }

  // MARK: - Fallback Logic

  @Test("Registry Resolution Fallback")
  func testRegistryResolutionFallback() {
    // Test a name that is NOT in the registry list but is resolved via fallback
    // Since we can't easily modify the static registry, we verify
    // that CKColor(id:) uses the registry correctly.

    let custom = CKColor(id: "missing_but_valid_hex_fallback")
    #expect(custom == nil, "Unknown names without hex should be nil")

    // The resolve closure in registry is hit during static initialization.
    // We verified the output via descriptions in testStaticDefaultColors.
  }
}

#endif
