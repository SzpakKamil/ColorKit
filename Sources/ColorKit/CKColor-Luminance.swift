//
//  CKColor-Luminance.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import Foundation
import SwiftUI

extension CKColor {
  public struct Luminance: DynamicProperty {
    @Environment(\.colorScheme) private var colorScheme

    private let color: CKColor

    /// Internal override for testing purposes.
    internal var _colorSchemeOverride: ColorScheme?

    private var effectiveColorScheme: ColorScheme {
      _colorSchemeOverride ?? colorScheme
    }

    /// Creates a luminance provider for the specified color.
    /// - Parameter color: The `CKColor` to monitor.
    public init(color: CKColor) {
      self.color = color
    }

    /// The calculated relative luminance for the current environment.
    public var wrappedValue: Double {
      let components: CKColor.RGBA?

      if effectiveColorScheme == .dark {
        components = color.darkComponents ?? color.components
      } else {
        components = color.components
      }

      guard let c = components else { return 0.5 }
      return Self.calculate(for: c, in: color.colorSpace)
    }

    /// Calculates perceptual lightness (OKLAB L) for a given set of RGBA components.
    /// - Parameters:
    ///   - components: The RGBA components.
    ///   - colorSpace: The color space of the components.
    /// - Returns: A value between 0.0 (black) and 1.0 (white), or > 1.0 for HDR.
    public static func calculate(for components: CKColor.RGBA, in colorSpace: CKColor.ColorSpace)
      -> Double
    {
      // FIXED: Eliminated duplicate math & Added HDR Support.
      // We delegate the calculation to the centralized CKColor.OKLAB struct.

      // 1. Ensure input is sRGB-compatible (required by CKColor.OKLAB init)
      let srgbComponents: CKColor.RGBA

      if colorSpace == .sRGB {
        srgbComponents = components
      } else {
        // 2. HDR & Wide Gamut Preservation
        // We convert to .extendedSRGB instead of .sRGB.
        // Standard .sRGB clamps values to [0, 1], which would kill HDR headroom
        // and clip P3 wide-gamut data. .extendedSRGB allows values < 0 and > 1,
        // passing the full dynamic range to the OKLAB math.

        let temp = CKColor(
          red: components.r,
          green: components.g,
          blue: components.b,
          opacity: components.a,
          headroom: components.headroom,
          colorSpace: colorSpace
        )

        // If conversion fails (unlikely), fallback to input to prevent crash.
        srgbComponents = temp.converted(to: .extendedSRGB).components ?? components
      }

      // 3. Extract L from the Single Source of Truth
      // CKColor.OKLAB handles extended range values mathematically, returning L > 1.0 for HDR.
      return CKColor.OKLAB(from: srgbComponents).L
    }
  }

  public func luminance(in scheme: ColorScheme) -> Double {
    let components: RGBA?

    if scheme == .dark {
      components = darkComponents ?? self.components
    } else {
      components = self.components
    }

    guard let c = components else { return 0.5 }
    return CKColor.Luminance.calculate(for: c, in: self.colorSpace)
  }
}
