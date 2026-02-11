# ``ColorKit/CKBlendMode/colorBurn``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Color Burn", style: symbol)
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

The color burn blend mode.

## Overview

Darkens the base color based on the blend color.

### Effect

`colorBurn` increases the contrast of the base color to reflect the blend color, resulting in darker and more saturated mid-tones. It is the opposite of `colorDodge`. Blending with white has no effect, while darker blend colors significantly darken the base.

- **Formula:** $1 - (1 - B) / S$

### Example Usage

```swift
import ColorKit

let base = CKColor.gray
let deepTint = CKColor.red

let result = base.blended(with: deepTint, mode: .colorBurn)
```
