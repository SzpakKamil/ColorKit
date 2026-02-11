# ``ColorKit/CKBlendMode/colorDodge``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Color Dodge", style: symbol)
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

The color dodge blend mode.

## Overview

Brightens the base color based on the blend color.

### Effect

`colorDodge` produces a very bright, high-contrast effect by decreasing the contrast of the base color towards the blend color. It is similar to the photographic process of "dodging" (reducing exposure to certain areas). Blending with black has no effect, while blending with white (or very light colors) can lead to significant brightening.

- **Formula:** $B / (1 - S)$

### Example Usage

```swift
import ColorKit

let base = CKColor(hexInt: 0x333333) // Dark Gray
let glow = CKColor.blue

let result = base.blended(with: glow, mode: .colorDodge)
```
