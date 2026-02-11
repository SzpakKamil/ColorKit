# ``ColorKit/CKColor/LAB/rgbRepresentation()``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("RGB Representation", style: symbol)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "13.0")
    @Available(iPadOS, introduced: "13.0")
    @Available(macOS, introduced: "10.15")
    @Available(tvOS, introduced: "13.0")
    @Available(watchOS, introduced: "6.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

Returns the RGB representation of the LAB components.

## Overview

The `rgbRepresentation()` method for `LAB` performs a multi-step transformation to convert perceptual lightness and color-opponent values back into the sRGB color space.

### Mathematical Process

1.  **Inverse f(t) Transformation:** Reverses the non-linear LAB scaling to return to the XYZ coordinate system.
2.  **Reference Scaling:** Scales the results relative to the D65 standard illuminant ($X=95.047, Y=100.000, Z=108.883$).
3.  **XYZ to Linear RGB:** Multiplies the XYZ values by the inverse sRGB primary matrix to calculate linear RGB light intensities.
4.  **Gamma Encoding:** Applies the standard sRGB transfer function (gamma correction) to convert linear light into encoded component values (0.0 to 1.0).
