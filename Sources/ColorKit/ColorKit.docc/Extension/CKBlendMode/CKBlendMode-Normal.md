# ``ColorKit/CKBlendMode/normal``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Normal", style: symbol)
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

The normal blend mode.

## Overview

In `normal` mode, the source (blend) color is simply placed over the destination (base) color. 

### Effect

This mode does not perform any mathematical transformation on the color components themselves. Instead, it relies entirely on the alpha channel of the blend color to determine how much of the base color remains visible. If the blend color is fully opaque, the base color is completely obscured.

### Example Usage

```swift
import ColorKit

let base = CKColor.blue
let overlay = CKColor.red.opacity(0.5)

// The result will be a 50/50 mix of blue and red
let result = base.blended(with: overlay, mode: .normal)
```
