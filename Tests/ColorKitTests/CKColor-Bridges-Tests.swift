#if compiler(>=6.0)
//
//  CKColor-Bridges-Tests.swift
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

@Suite("Test CKColor Bridges")
struct CKColorBridgesTest {

  @Test("Test NativeColor - CKColor")
  func testNativeColorCKColor() {
    #if os(watchOS)
      let color = NativeColor.red
    #else
      let color = NativeColor.systemRed
    #endif
    #expect(color.ckColor == CKColor(nativeColor: color), "Init doesnt work the same as extension")
  }

  @available(iOS 14.0, watchOS 7.0, macOS 11.0, tvOS 14.0, *)
  @Test("Test Color - CKColor")
  func testColorCKColor() {
    let color = Color.red
    #expect(color.ckColor == CKColor(color), "Init doesnt work the same as extension")
  }

  #if canImport(CoreImage)
    @Test("Test CIColor - CKColor")
    func testCIColorCKColor() {
      let ciColor = CIColor(red: 1, green: 0, blue: 0, alpha: 1)
      #expect(
        ciColor.ckColor == CKColor(ciColor: ciColor), "Init doesnt work the same as extension")
    }
  #endif

  @Test("Test CGColor - CKColor")
  func testCGColorCKColor() {
    let cgColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
    #expect(cgColor.ckColor == CKColor(cgColor: cgColor), "Init doesnt work the same as extension")
  }

  @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
  @Test("Test SwiftUI Shape - CKColor")
  func testSwiftUIShapeCKColor() {
    #if os(watchOS)
      let color = Color(red: 1.0, green: 0, blue: 0)
      #expect(color.ckColor == CKColor(color).resolve(in: .init()).ckColor)
    #else
      let color = Color.red
      #expect(color.ckColor == CKColor(color).resolve(in: .init()).ckColor)
    #endif
  }

  @Test("NativeColor Bridge captures P3 Gamut and Components")
  func testNativeColorBridgePrecision() {

    let p3Red = NativeColor(displayP3Red: 1.0, green: 0.1, blue: 0.1, alpha: 1.0)
    let ck = p3Red.ckColor
    #if os(macOS)
      #expect(ck.colorSpace == .displayP3)
      #expect(abs(ck.rgbComponents().r - 1.0) < 0.0001)
      #expect(abs(ck.rgbComponents().g - 0.1) < 0.0001)
    #else
      // On iOS/watchOS, the system may normalize DisplayP3 to Extended sRGB.
      // We accept both as long as the wide-gamut data is preserved.
      #expect(ck.colorSpace == .displayP3 || ck.colorSpace == .extendedSRGB)

      if ck.colorSpace == .displayP3 {
        #expect(abs(ck.rgbComponents().r - 1.0) < 0.0001)
        #expect(abs(ck.rgbComponents().g - 0.1) < 0.0001)
      } else {
        // P3(1, 0.1, 0.1) in Extended sRGB is approx (1.0922, -0.1953)
        #expect(abs(ck.rgbComponents().r - 1.0922) < 0.001)
        #expect(abs(ck.rgbComponents().g + 0.1953) < 0.001)
      }
    #endif
  }

  @Test("Direct CKColor P3 Initialization")

  func testDirectCKColorP3() {

    // This test ensures that CKColor correctly maintains P3 components when

    // initialized directly, bypassing any potential OS-level normalization.

    let ck = CKColor(red: 1.0, green: 0.1, blue: 0.1, opacity: 1.0, colorSpace: .displayP3)

    #expect(ck.colorSpace == .displayP3)

    #expect(abs(ck.rgbComponents().r - 1.0) < 0.0001)

    #expect(abs(ck.rgbComponents().g - 0.1) < 0.0001)

    // Verify native conversion also maintains P3 if supported

    let native = ck.nativeColor

    let recon = native.ckColor

    #if os(macOS)

      #expect(recon.colorSpace == .displayP3)

      #expect(abs(recon.rgbComponents().r - 1.0) < 0.0001)

    #endif

  }

  @Test("Dynamic Color Bridge Persistence")
  func testSystemColorDynamicResolution() {
    #if os(watchOS)
      let systemColor = NativeColor.blue
    #else
      let systemColor = NativeColor.systemBlue
    #endif

    let ck = systemColor.ckColor

    #expect(CKColor.isStandardName("blue"))
    #expect(ck.id.primary != 0)
  }

  @Test("CGColor Bridge with specific ColorSpace")
  func testCGColorSpacePreservation() {
    let space = CGColorSpace(name: CGColorSpace.extendedLinearSRGB)!
    let components: [CGFloat] = [1.5, 0.5, 0.5, 1.0]  // HDR values
    let cgColor = CGColor(colorSpace: space, components: components)!

    let ck = cgColor.ckColor

    #expect(ck.rgbComponents().r > 1.0)
  }
}

#endif
