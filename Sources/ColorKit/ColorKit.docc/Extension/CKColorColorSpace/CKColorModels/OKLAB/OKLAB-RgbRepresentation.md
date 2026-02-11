# ``ColorKit/CKColor/OKLAB/rgbRepresentation()``

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

Returns the RGB representation of the OKLAB components.

## Overview

The `rgbRepresentation()` method implements the inverse of Björn Ottosson's perceptual model to convert OKLAB components back to standard sRGB.

### Mathematical Process

1.  **OKLAB to LMS':** Applies an inverse matrix (Inverse M2) to transform perceptual $L, a, b$ coordinates into a non-linear long-medium-short (LMS) cone response space.
2.  **LMS' to Linear LMS:** Cubes the non-linear LMS components to return to a linear representation of light intensity.
3.  **Linear LMS to Linear sRGB:** Applies the inverse primary matrix (Inverse M1) to transform the linear cone responses into linear RGB values.
4.  **Gamma Correction:** Applies the standard sRGB transfer function to convert linear values into the final gamma-encoded RGBA components.
