# ``ColorKit/CKBlendMode/difference``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Difference", style: symbol)
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

The difference blend mode.

## Overview

Calculates the difference between the base and blend colors.

### Effect

This mode subtracts the darker color from the lighter color for each channel. 
- Blending with white inverts the base color values.
- Blending with black produces no change.

The result is often vibrant and "psychedelic" when using highly different colors, and it is technically useful for aligning two similar images or UI elements.

- **Formula:** $|B - S|$

### Example Usage

```swift
import ColorKit

let base = CKColor.white
let blend = CKColor.red

// The result will be Cyan (the inverse of Red)
let result = base.blended(with: blend, mode: .difference)
```
