# ``ColorKit/CKColor/ColorSpace/lab``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("LAB", style: symbol)
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

CIE 1976 L*a*b* color space.

## Overview

The `lab` case represents the CIE LAB color space, designed to be perceptually uniform. It consists of a Lightness axis (L*) and two color-opponent dimensions (a* and b*). It is widely used as a standard for colorimetric calculations.

### Details

- **Type:** Perceptual.
- **Reference:** ISO 11664-4:2008.
- **Axes:** L* (Lightness), a* (Green-Red), b* (Blue-Yellow).

### Example Usage

```swift
import ColorKit

// Initialize a color using perceptual LAB components
let color = CKColor(
    L: 50.0, 
    a: 100.0, 
    b: 50.0, 
    colorSpace: .lab
)
```

### Credits

- **Reference:** ISO 11664-4:2008 (CIE S 014-4/E:2007).
