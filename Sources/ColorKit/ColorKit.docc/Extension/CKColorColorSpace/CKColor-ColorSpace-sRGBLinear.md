# ``ColorKit/CKColor/ColorSpace/sRGBLinear``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("sRGB Linear", style: symbol)
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

Linear sRGB color space.

## Overview

The `sRGBLinear` color space uses the same primaries as `sRGB` but employs a linear transfer function instead of a gamma curve. This makes it ideal for mathematical operations like color blending and compositing, where physical light behavior needs to be accurately simulated.

### Details

- **Type:** Linear.
- **Transfer Function:** Linear (No gamma correction).
- **Usage:** Advanced color math and light simulation.

### Example Usage

```swift
import ColorKit

// Initialize a linear color for precise math operations
let linearColor = CKColor(
    red: 0.5, 
    green: 0.5, 
    blue: 0.5, 
    colorSpace: .sRGBLinear
)
```
