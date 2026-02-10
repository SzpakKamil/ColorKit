//
//  CKColor-GamutMapping.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import Foundation

extension CKColor {

  /// Converts the current color to a specific target color space using Perceptual Gamut Mapping.
  ///
  /// Instead of hard-clipping out-of-gamut values, this implementation uses an iterative
  /// OKLAB-based approach to preserve perceptual intent (Lightness and Hue) while reducing Chroma.
  ///
  /// - Parameter targetSpace: The destination color space.
  /// - Returns: A new `CKColor` mapped to the target gamut.
  public func converted(to targetSpace: CKColor.ColorSpace, iterations: Int = 6) -> CKColor {
    if self.colorSpace == targetSpace { return self }

    let convertComponents = { (source: RGBA) -> RGBA in
      // 1. Linearize (Source Gamma -> Source Linear)
      let sourceLinear = self.colorSpace.linearRepresentation(for: source)

      // 2. Convert to CIE XYZ (D65)
      let xyz = self.colorSpace.toXYZ(r: sourceLinear.r, g: sourceLinear.g, b: sourceLinear.b)

      // 3. Convert to Target Linear RGB
      let targetLinear = targetSpace.fromXYZ(x: xyz.x, y: xyz.y, z: xyz.z)

      // 4. Apply Target Transfer Function (Target Linear -> Target Gamma)
      let targetR = targetSpace.fromLinear(targetLinear.r)
      let targetG = targetSpace.fromLinear(targetLinear.g)
      let targetB = targetSpace.fromLinear(targetLinear.b)

      // 5. Perceptual Gamut Mapping Logic

      // Passthrough for HDR/Extended ranges (no mapping needed)
      if targetSpace == .extendedSRGB
        || (targetSpace == .displayP3 && (source.headroom ?? 1.0) > 1.0)
      {
        return RGBA(r: targetR, g: targetG, b: targetB, a: source.a, headroom: source.headroom)
      }

      // Fast Path: If the color is already in-gamut (0-1), return as is.
      if targetR >= 0 && targetR <= 1 && targetG >= 0 && targetG <= 1 && targetB >= 0
        && targetB <= 1
      {
        return RGBA(r: targetR, g: targetG, b: targetB, a: source.a, headroom: source.headroom)
      }

      // Out-of-Gamut: Perform Perceptual Mapping
      return self.performPerceptualMapping(
        r: targetR, g: targetG, b: targetB, alpha: source.a, iterations: iterations,
        space: targetSpace)
    }

    guard let sourceComponents = self.components else {
      return CKColor(red: 0, green: 0, blue: 0, opacity: 1, colorSpace: targetSpace)
    }

    let p = convertComponents(sourceComponents)
    let primaryDef = ColorDefinition.custom(CKColor.Converter(rgba: p))

    var darkDef: ColorDefinition?
    if let d = self.darkComponents {
      darkDef = .custom(CKColor.Converter(rgba: convertComponents(d)))
    }

    var hcDef: ColorDefinition?
    if let hc = self.highContrastComponents {
      hcDef = .custom(CKColor.Converter(rgba: convertComponents(hc)))
    }

    var hcdDef: ColorDefinition?
    if let hcd = self.highContrastDarkComponents {
      hcdDef = .custom(CKColor.Converter(rgba: convertComponents(hcd)))
    }

    return CKColor(
      primary: primaryDef,
      dark: darkDef,
      highContrast: hcDef,
      highContrastDark: hcdDef,
      colorSpace: targetSpace
    )
  }

  /// Iteratively desaturates a color in OKLAB space until it fits the target gamut.
  private func performPerceptualMapping(
    r: Double, g: Double, b: Double, alpha: Double, iterations: Int, space: CKColor.ColorSpace
  ) -> RGBA {

    // 1. Establish the "Perceptual Ground Truth" in OKLAB.
    // Since CKColor.OKLAB assumes sRGB input, and 'r,g,b' are in 'space' (e.g. P3),
    // we must first convert these components to sRGB to get the correct L,a,b values.

    // Linearize input (Target Space)
    let linear = space.linearRepresentation(for: RGBA(r: r, g: g, b: b, a: alpha))
    // Convert to XYZ
    let xyz = space.toXYZ(r: linear.r, g: linear.g, b: linear.b)
    // Convert to sRGB Linear
    let srgbLinear = CKColor.ColorSpace.sRGB.fromXYZ(x: xyz.x, y: xyz.y, z: xyz.z)
    // Convert to sRGB Gamma
    let srgbR = CKColor.ColorSpace.sRGB.fromLinear(srgbLinear.r)
    let srgbG = CKColor.ColorSpace.sRGB.fromLinear(srgbLinear.g)
    let srgbB = CKColor.ColorSpace.sRGB.fromLinear(srgbLinear.b)

    // Now create the OKLAB reference from the standard sRGB representation
    let tempSRGB = RGBA(r: srgbR, g: srgbG, b: srgbB, a: alpha)
    var lab = OKLAB(from: tempSRGB)

    // 2. Iterative Reduction
    // We reduce Chroma (a, b) until the color fits into the *Target Space*.
    let maxIterations = iterations
    var minChroma = 0.0
    var maxChroma = 1.0
    let originalA = lab.a
    let originalB = lab.b

    var finalRGB = RGBA(r: r, g: g, b: b, a: alpha)

    for _ in 0..<maxIterations {
      let midChroma = (minChroma + maxChroma) / 2.0
      lab = OKLAB(L: lab.L, a: originalA * midChroma, b: originalB * midChroma, alpha: alpha)

      // OKLAB -> sRGB
      let testSRGB = lab.rgbRepresentation()

      // sRGB -> Target Space (e.g. P3)
      // We must check if the color fits in the TARGET space, not just sRGB.
      let testLinear = CKColor.ColorSpace.sRGB.linearRepresentation(for: testSRGB)
      let testXYZ = CKColor.ColorSpace.sRGB.toXYZ(r: testLinear.r, g: testLinear.g, b: testLinear.b)
      let targetLinear = space.fromXYZ(x: testXYZ.x, y: testXYZ.y, z: testXYZ.z)

      let tr = space.fromLinear(targetLinear.r)
      let tg = space.fromLinear(targetLinear.g)
      let tb = space.fromLinear(targetLinear.b)

      // Check bounds in the Target Space
      if tr >= -0.0001 && tr <= 1.0001 && tg >= -0.0001 && tg <= 1.0001 && tb >= -0.0001
        && tb <= 1.0001
      {
        minChroma = midChroma
        finalRGB = RGBA(r: tr, g: tg, b: tb, a: alpha)
      } else {
        maxChroma = midChroma
      }

      if (maxChroma - minChroma) < 0.001 { break }
    }

    return RGBA(
      r: max(0, min(1, finalRGB.r)),
      g: max(0, min(1, finalRGB.g)),
      b: max(0, min(1, finalRGB.b)),
      a: alpha
    )
  }
}

// MARK: - Mathematical Backend
extension CKColor.ColorSpace {

  fileprivate func toXYZ(r: Double, g: Double, b: Double) -> (x: Double, y: Double, z: Double) {
    let m: [Double]
    switch self {
    case .sRGB, .sRGBLinear, .extendedLinearSRGB, .extendedSRGB, .hsl, .cmyk, .lab, .okLab, .lch:
      m = Matrices.sRGB_to_XYZ
    case .displayP3: m = Matrices.P3_to_XYZ
    case .adobeRGB: m = Matrices.AdobeRGB_to_XYZ
    case .rommRGB: m = Matrices.ROMM_to_XYZ
    }

    return (
      r * m[0] + g * m[1] + b * m[2],
      r * m[3] + g * m[4] + b * m[5],
      r * m[6] + g * m[7] + b * m[8]
    )
  }

  fileprivate func fromXYZ(x: Double, y: Double, z: Double) -> (r: Double, g: Double, b: Double) {
    let m: [Double]
    switch self {
    case .sRGB, .sRGBLinear, .extendedLinearSRGB, .extendedSRGB, .hsl, .cmyk, .lab, .okLab, .lch:
      m = Matrices.XYZ_to_sRGB
    case .displayP3: m = Matrices.XYZ_to_P3
    case .adobeRGB: m = Matrices.XYZ_to_AdobeRGB
    case .rommRGB: m = Matrices.XYZ_to_ROMM
    }

    return (
      x * m[0] + y * m[1] + z * m[2],
      x * m[3] + y * m[4] + z * m[5],
      x * m[6] + y * m[7] + z * m[8]
    )
  }
}

// Matrices
extension CKColor.ColorSpace.Matrices {
  static let AdobeRGB_to_XYZ: [Double] = [
    0.5767309, 0.1855540, 0.1881852, 0.2973769, 0.6273491, 0.0752741, 0.0270343, 0.0706872,
    0.9911085,
  ]
  static let XYZ_to_AdobeRGB: [Double] = [
    2.0413690, -0.5649464, -0.3446944, -0.9692660, 1.8760108, 0.0415560, 0.0134474, -0.1183897,
    1.0154096,
  ]
  static let XYZ_to_P3: [Double] = [
    2.4934969, -0.9313836, -0.4027108, -0.8294890, 1.7626641, 0.0236247, 0.0358458, -0.0761724,
    0.9568845,
  ]
  static let ROMM_to_XYZ: [Double] = [
    0.7976749, 0.1351917, 0.0313534, 0.2880402, 0.7118741, 0.0000857, 0.0000000, 0.0000000,
    0.8252100,
  ]
  static let XYZ_to_ROMM: [Double] = [
    1.3459433, -0.2556075, -0.0511118, -0.5445989, 1.5081673, 0.0205351, 0.0000000, 0.0000000,
    1.2118128,
  ]
}
