//
//  CKColor-Blending.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI

// MARK: - Blend Modes
@frozen
public enum CKBlendMode: String, CaseIterable, Sendable {
  case normal
  case multiply
  case screen
  case overlay
  case darken
  case lighten
  case colorDodge
  case colorBurn
  case softLight
  case hardLight
  case difference
  case exclusion
}

// MARK: - CKColor Blending
extension CKColor {

  /// Blends this color (base) with another color (blend) using a specific blend mode.
  ///
  /// This operation preserves dynamic system traits and uses Porter-Duff "Source Over"
  /// compositing to ensure mathematically accurate transparency results.
  ///
  /// - Parameters:
  ///   - blendColor: The color to blend on top of the base.
  ///   - mode: The blending formula to apply (e.g., .overlay, .multiply).
  ///   - opacity: The opacity of the blend layer (0.0 to 1.0). Default is 1.0.
  /// - Returns: A new dynamic `CKColor`.
  public func blended(with blendColor: CKColor, mode: CKBlendMode, opacity: Double = 1.0) -> CKColor
  {
    // 1. Unify Color Space (Defaulting to Base Space)
    let space = self.colorSpace
    let cb = blendColor.colorSpace == space ? blendColor : blendColor.converted(to: space)

    // 2. Access Resolved Components for all modes
    let baseR = self.resolvedNativeComponents
    let blendR = cb.resolvedNativeComponents

    // 3. Perform Blending for all 4 dynamic states
    let l = apply(mode: mode, base: baseR.light, blend: blendR.light, opacity: opacity)
    let d = apply(mode: mode, base: baseR.dark, blend: blendR.dark, opacity: opacity)
    let hc = apply(
      mode: mode, base: baseR.highContrast, blend: blendR.highContrast, opacity: opacity)
    let hcd = apply(
      mode: mode, base: baseR.highContrastDark, blend: blendR.highContrastDark, opacity: opacity)

    // 4. Construct the Result
    return CKColor(
      primary: .custom(CKColor.Converter(rgba: l)),
      dark: .custom(CKColor.Converter(rgba: d)),
      highContrast: .custom(CKColor.Converter(rgba: hc)),
      highContrastDark: .custom(CKColor.Converter(rgba: hcd)),
      colorSpace: space
    )
  }

  // MARK: - Math Engine

  private func apply(mode: CKBlendMode, base: RGBA, blend: RGBA, opacity: Double) -> RGBA {
    // Source Alpha adjusted by user-defined opacity
    let aSrc = max(0, min(1, opacity * blend.a))
    let aDst = base.a

    // 1. Porter-Duff "Source Over" Alpha Calculation: aR = aSrc + aDst * (1 - aSrc)
    let finalAlpha = aSrc + aDst * (1.0 - aSrc)

    // Guard against division by zero if both layers are fully transparent
    if finalAlpha == 0 { return RGBA(r: 0, g: 0, b: 0, a: 0, headroom: base.headroom) }

    // 2. Vectorize Color Channels
    let bVec = SIMD3<Double>(base.r, base.g, base.b)
    let sVec = SIMD3<Double>(blend.r, blend.g, blend.b)

    // Prepare clamped vectors for standard blend formula stability
    let zero = SIMD3<Double>(repeating: 0)
    let one = SIMD3<Double>(repeating: 1)
    let bC = bVec.replacing(with: zero, where: bVec .< zero).replacing(
      with: one, where: bVec .> one)
    let sC = sVec.replacing(with: zero, where: sVec .< zero).replacing(
      with: one, where: sVec .> one)

    // 3. Perform the Blend Mode Math (Fully Vectorized)
    let blendedVec: SIMD3<Double>
    switch mode {
    case .normal:
      blendedVec = sC
    case .multiply:
      blendedVec = bC * sC
    case .screen:
      blendedVec = 1.0 - (1.0 - bC) * (1.0 - sC)
    case .overlay:
      let m1 = 2.0 * bC * sC
      let m2 = 1.0 - 2.0 * (1.0 - bC) * (1.0 - sC)
      blendedVec = m2.replacing(with: m1, where: bC .< 0.5)
    case .darken:
      blendedVec = sC.replacing(with: bC, where: bC .< sC)
    case .lighten:
      blendedVec = sC.replacing(with: bC, where: bC .> sC)
    case .colorDodge:
      let d = (one - sC).replacing(with: one, where: sC .== 1.0)
      let div = bC / d
      let res = div.replacing(with: one, where: div .> 1.0)
      blendedVec = res.replacing(with: one, where: sC .== 1.0)
    case .colorBurn:
      let d = sC.replacing(with: one, where: sC .== 0.0)
      let div = (one - bC) / d
      let res = one - div.replacing(with: one, where: div .> 1.0)
      blendedVec = res.replacing(with: zero, where: sC .== 0.0)
    case .softLight:
      let s1 = bC - (1.0 - 2.0 * sC) * bC * (1.0 - bC)
      let root = SIMD3<Double>(bC.x.squareRoot(), bC.y.squareRoot(), bC.z.squareRoot())
      let s2 = bC + (2.0 * sC - 1.0) * (root - bC)
      blendedVec = s2.replacing(with: s1, where: sC .<= 0.5)
    case .hardLight:
      let h1 = 2.0 * bC * sC
      let h2 = 1.0 - 2.0 * (1.0 - bC) * (1.0 - sC)
      blendedVec = h2.replacing(with: h1, where: sC .< 0.5)
    case .difference:
      let diff = bC - sC
      blendedVec = diff.replacing(with: -diff, where: diff .< 0)
    case .exclusion:
      blendedVec = bC + sC - 2.0 * bC * sC
    }

    // 4. Vectorized Porter-Duff Compositing:
    // Result = (Blended * aSrc + Base * aDst * (1 - aSrc)) / finalAlpha
    let resVec = (blendedVec * aSrc + bVec * aDst * (1.0 - aSrc)) / finalAlpha

    return RGBA(r: resVec.x, g: resVec.y, b: resVec.z, a: finalAlpha, headroom: base.headroom)
  }
}

// MARK: - SwiftUI Bridge
extension Color {
  @available(iOS 14.0, watchOS 7.0, macOS 11.0, tvOS 14.0, *)
  public func blended(with blendColor: Color, mode: CKBlendMode, opacity: Double = 1.0) -> Color {
    return self.ckColor.blended(with: blendColor.ckColor, mode: mode, opacity: opacity).color
  }
}
