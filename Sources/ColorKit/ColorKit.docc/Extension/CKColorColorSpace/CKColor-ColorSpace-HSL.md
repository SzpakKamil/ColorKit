# ``ColorKit/CKColor/ColorSpace/hsl``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("HSL", style: symbol)
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

HSL color model representation.

## Overview

The `hsl` case represents the Hue, Saturation, and Lightness color model. In ColorKit, this is typically used as a working model for UI-friendly color adjustments and is internally represented using sRGB coordinates.

### Details

- **Axes:** Hue (0-360°), Saturation (0-1), Lightness (0-1).
- **Usage:** Design-oriented color selection and procedural variations.

### Example Usage

```swift
import ColorKit

// Initialize a CKColor using HSL components
let color = CKColor(
    hue: 240.0, 
    saturation: 1.0, 
    lightness: 0.5, 
    colorSpace: .hsl
)
```
