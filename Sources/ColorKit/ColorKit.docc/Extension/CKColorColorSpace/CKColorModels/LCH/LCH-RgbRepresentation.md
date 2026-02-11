# ``ColorKit/CKColor/LCH/rgbRepresentation()``

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

Returns the RGB representation of the LCH components.

## Overview

The `rgbRepresentation()` method for `LCH` converts cylindrical color coordinates back to the rectangular RGB system by leveraging the `LAB` conversion engine.

### Mathematical Process

1.  **Cylindrical to Rectangular:** Converts Chroma ($C$) and Hue angle ($h$) into the LAB color-opponent coordinates:
    - $a = C \times \cos(h)$
    - $b = C \times \sin(h)$
2.  **LAB to RGB Delegation:** Passes the resulting $L, a, b$ components to the ``ColorKit/CKColor/LAB/rgbRepresentation()`` method to complete the transformation to sRGB.
