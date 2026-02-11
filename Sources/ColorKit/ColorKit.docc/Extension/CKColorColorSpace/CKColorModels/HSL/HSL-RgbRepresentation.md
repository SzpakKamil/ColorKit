# ``ColorKit/CKColor/HSL/rgbRepresentation()``

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

Returns the RGB representation of the HSL components.

## Overview

The `rgbRepresentation()` method for `HSL` converts the cylindrical Hue, Saturation, and Lightness coordinates back into the additive RGB color space.

### Mathematical Process

1.  **Chroma Calculation:** Calculates chroma ($C$) using saturation and lightness.
2.  **Hue-based Components:** Determines intermediate values based on the hue angle's position within the six sectors of the color wheel.
3.  **Lightness Adjustment:** Offsets the intermediate components by a matching value ($m$) derived from the target lightness.
4.  **RGBA Construction:** Combines the calculated channels with the existing alpha and headroom.
