//
//  CKColor-Contrast.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI

public struct CKAPCA: Sendable {
  /// Coefficients for the APCA algorithm.
  /// Default values based on APCA-W3 (Silver).
  public struct Constants: Sendable {
    public var sExpt: Double = 0.56
    public var bgExpt: Double = 1.61
    public var txtExpt: Double = 1.14
    public var blkThrs: Double = 0.02
    public var scale: Double = 1.14

    public init() {}
  }

  /// Thresholds for accessibility compliance lookup.
  public struct Thresholds: Sendable {
    public typealias Lookup = (_ size: Double, _ weight: CKColor.FontWeight) -> Double

    /// The closure determining the required Lc based on font size/weight.
    /// Defaults to Silver Level Draft.
    public var lookup: @Sendable (Double, CKColor.FontWeight) -> Double

    public init(lookup: @escaping @Sendable (Double, CKColor.FontWeight) -> Double) {
      self.lookup = lookup
    }

    public static let silver = Thresholds { size, weight in
      switch weight {
      case .thin, .extraLight:
        if size >= 48 { return 60 }
        if size >= 36 { return 75 }
        return 90
      case .light:
        if size >= 36 { return 60 }
        if size >= 24 { return 75 }
        return 90
      case .regular:
        if size >= 24 { return 60 }
        if size >= 18 { return 75 }
        return 90
      case .medium, .semibold:
        if size >= 18 { return 60 }
        if size >= 14 { return 75 }
        return 85
      case .bold, .extraBold, .black:
        if size >= 14 { return 60 }
        if size >= 12 { return 75 }
        return 80
      }
    }
  }

  /// Global configuration instance. Modify this to update algorithm parameters.
  public static let sharedConstants = Constants()
  public static let sharedThresholds = Thresholds.silver
}

extension CKColor {

  // MARK: - Luminance & Lightness (HDR Compatible)

  /// Returns the linear luminance (Y) using Rec. 709 coefficients.
  ///
  /// This property is HDR-compatible and does not clamp values to the 0.0–1.0 range,
  /// allowing it to accurately represent Display P3 headroom.
  /// - Note: Formula: $0.2126R + 0.7152G + 0.0722B$ in linear space.
  public var linearLuminance: Double {
    guard let c = components else { return 0.5 }
    let linear = self.colorSpace.linearRepresentation(for: c)

    // HDR Support: We allow values > 1.0 to persist for high-dynamic-range math.
    return 0.2126 * linear.r + 0.7152 * linear.g + 0.0722 * linear.b
  }

  // MARK: - WCAG 2.1 Compliance

  /// Returns a legacy WCAG 2.1 relative luminance clamped to the SDR range (0-1).
  public var wcagLuminance: Double {
    let y = linearLuminance
    return max(0, min(1, y))
  }

  /// Calculates the legacy WCAG 2.1 contrast ratio.
  /// - Returns: A value between 1.0 and 21.0 (or higher if using HDR colors).
  public func contrastRatio(with other: CKColor) -> Double {
    let l1 = self.wcagLuminance
    let l2 = other.wcagLuminance

    let lighter = max(l1, l2)
    let darker = min(l1, l2)

    return (lighter + 0.05) / (darker + 0.05)
  }

  // MARK: - WCAG 3.0 (APCA)

  /// Standard font weights mapped to numeric values for APCA lookup.
  public enum FontWeight: Double, Sendable, CaseIterable {
    case thin = 100
    case extraLight = 200
    case light = 300
    case regular = 400
    case medium = 500
    case semibold = 600
    case bold = 700
    case extraBold = 800
    case black = 900
  }

  /// Calculates the APCA Lightness Contrast (Lc) value (-108 to +106).
  public func apcaContrast(on background: CKColor) -> Double {
    let txtL = self.linearLuminance
    let bgL = background.linearLuminance

    let C = CKAPCA.sharedConstants
    var sapca = 0.0

    if bgL > txtL {
      // Dark text on Light background (Negative Lc in standard APCA)
      sapca = (pow(bgL, C.bgExpt) - pow(txtL, C.txtExpt)) * C.scale
      sapca = -sapca  // Invert to follow Lc convention (Dark-on-Light is negative)
    } else {
      // Light text on Dark background (Positive Lc in standard APCA)
      sapca = (pow(bgL, C.txtExpt) - pow(txtL, C.bgExpt)) * C.scale
      sapca = abs(sapca)  // Ensure positive
    }

    if abs(sapca) < C.blkThrs { return 0.0 }

    return sapca > 0 ? pow(sapca, C.sExpt) * 100.0 : -pow(abs(sapca), C.sExpt) * 100.0
  }

  public func isAPCAAccessible(on background: CKColor, size: Double, weight: FontWeight = .regular)
    -> Bool
  {
    let lc = abs(self.apcaContrast(on: background))
    // FIXED: Using configurable thresholds
    let requiredLc = CKAPCA.sharedThresholds.lookup(size, weight)
    return lc >= requiredLc
  }
}
