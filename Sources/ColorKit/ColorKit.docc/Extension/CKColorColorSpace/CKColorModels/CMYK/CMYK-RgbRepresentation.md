# ``ColorKit/CKColor/CMYK/rgbRepresentation()``

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

Returns the RGB representation of the CMYK components.

## Overview

The `rgbRepresentation()` method converts subtractive print components (Cyan, Magenta, Yellow, Key) into additive light components (Red, Green, Blue).

### Mathematical Process

The conversion follows the standard CMYK-to-RGB formulas:
- $R = (1 - C) \times (1 - K)$
- $G = (1 - M) \times (1 - K)$
- $B = (1 - Y) \times (1 - K)$

This assumes a standard digital display profile and is suitable for on-screen previewing of print colors.
