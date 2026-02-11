# ``ColorKit/CKBlendMode/lighten``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Lighten", style: symbol)
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

The lighten blend mode.

## Overview

Selects the lighter components between two colors.

### Effect

This mode compares the Red, Green, and Blue channels of the base and blend colors individually and keeps whichever value is higher. Like `darken`, it doesn't mix colors but chooses the brightest pixels from the available layers.

- **Formula:** $\max(B, S)$

### Example Usage

```swift
import ColorKit

let color1 = CKColor.red
let color2 = CKColor.blue

// The result will be magenta (1,0,1), as it takes the max of each channel
let result = color1.blended(with: color2, mode: .lighten)
```
