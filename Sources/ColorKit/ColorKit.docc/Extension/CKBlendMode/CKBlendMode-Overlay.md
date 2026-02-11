# ``ColorKit/CKBlendMode/overlay``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Overlay", style: symbol)
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

The overlay blend mode.

## Overview

Combines `multiply` and `screen` blend modes based on the base color.

### Effect

`overlay` preserves the highlights and shadows of the base color while mixing in the blend color. 
- If the base color is light, it uses the `screen` logic to further brighten the result.
- If the base color is dark, it uses `multiply` logic to deepen the result.

This is highly effective for adding texture or color tints while maintaining the perceived depth of the original image or shape.

### Example Usage

```swift
import ColorKit

let base = CKColor.gray
let tint = CKColor.orange

let result = base.blended(with: tint, mode: .overlay)
```
