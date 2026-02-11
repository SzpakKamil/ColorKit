# ``ColorKit/CKColor/ColorSpace/lch``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("LCH", style: symbol)
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

CIE L*C*h° color space.

## Overview

The `lch` case represents the cylindrical representation of the CIE LAB color space. It uses Lightness (L), Chroma (C), and Hue angle (h) as its coordinates, providing a highly intuitive way to reason about and manipulate colors programmatically.

### Details

- **Axes:** L (Lightness), C (Chroma), h (Hue angle in degrees).
- **Usage:** Intuitive color generation and design system implementations.

### Example Usage

```swift
import ColorKit

// Initialize a color using intuitive LCH coordinates
let color = CKColor(
    L: 50.0, 
    C: 100.0, 
    h: 40.0, 
    colorSpace: .lch
)
```
