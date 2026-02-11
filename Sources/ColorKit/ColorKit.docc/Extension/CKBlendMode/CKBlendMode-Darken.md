# ``ColorKit/CKBlendMode/darken``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Darken", style: symbol)
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

The darken blend mode.

## Overview

Selects the darker components between two colors.

### Effect

This mode compares the Red, Green, and Blue channels of the base and blend colors individually and keeps whichever value is lower. It does not create new colors through mixing but rather "filters" the image to only show the darkest parts of both layers.

- **Formula:** $\min(B, S)$

### Example Usage

```swift
import ColorKit

let color1 = CKColor.red
let color2 = CKColor.blue

// The result will be black, as red is (1,0,0) and blue is (0,0,1)
// The min of each channel is 0.
let result = color1.blended(with: color2, mode: .darken)
```
