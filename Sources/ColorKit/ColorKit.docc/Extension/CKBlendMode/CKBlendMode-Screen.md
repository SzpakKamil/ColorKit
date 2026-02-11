# ``ColorKit/CKBlendMode/screen``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Screen", style: symbol)
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

The screen blend mode.

## Overview

Inverts both colors, multiplies them, and then inverts the result.

### Effect

This produces a color that is always lighter than the originals. It is the mathematical opposite of `multiply`. Screening with white results in white, and screening with black leaves the color unchanged. It is commonly used to create highlights or to simulate light being projected onto a surface.

- **Formula:** $1 - (1 - B) \times (1 - S)$

### Example Usage

```swift
import ColorKit

let base = CKColor.blue
let highlight = CKColor.white.opacity(0.3)

// The result will be a lighter, washed-out blue
let result = base.blended(with: highlight, mode: .screen)
```
