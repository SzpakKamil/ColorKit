# ``ColorKit/CKColor/ColorSpace/extendedLinearSRGB``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("Extended Linear sRGB", style: symbol)
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

Extended Linear sRGB color space.

## Overview

The `extendedLinearSRGB` color space is a linear space that allows component values outside the standard 0.0 to 1.0 range. This is essential for representing high-dynamic-range (HDR) data and colors that exist outside the standard sRGB gamut while maintaining a linear light representation.

### Details

- **Type:** Linear, High Dynamic Range (HDR) capable.
- **Range:** Allows values < 0.0 and > 1.0.
- **Usage:** HDR image processing and wide-gamut calculations.

### Example Usage

```swift
import ColorKit

// Initialize an HDR color with values exceeding the standard 0...1 range
let hdrColor = CKColor(
    red: 1.2, 
    green: 0.8, 
    blue: 0.8, 
    colorSpace: .extendedLinearSRGB
)
```
