# ``ColorKit/CKBlendMode/multiply``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Multiply", style: symbol)
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

The multiply blend mode.

## Overview

Multiplies the components of the base color by the blend color.

### Effect

The resulting color is always darker than the original colors. Multiplying any color with black results in black ($0 \times B = 0$), and multiplying with white leaves the color unchanged ($1 \times B = B$). It is often used to create shadows or to simulate the effect of multiple layers of semi-transparent ink.

- **Formula:** $B \times S$ (where $B$ is base and $S$ is source/blend).

### Example Usage

```swift
import ColorKit

let base = CKColor.gray
let blend = CKColor.red

// The result will be a significantly darker red
let result = base.blended(with: blend, mode: .multiply)
```
