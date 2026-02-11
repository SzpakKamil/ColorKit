# ``ColorKit/CKBlendMode/softLight``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Soft Light", style: symbol)
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

The soft light blend mode.

## Overview

Creates a subtle lighting effect based on the blend color.

### Effect

The effect is similar to shining a diffused spotlight on the image. 
- If the blend color is lighter than 50% gray, the image is lightened.
- If the blend color is darker than 50% gray, the image is darkened.

Compared to `overlay`, `softLight` produces much more natural and subtle results, making it ideal for soft UI gradients or atmospheric tints.

### Example Usage

```swift
import ColorKit

let base = CKColor.blue
let softTint = CKColor.white.opacity(0.2)

let result = base.blended(with: softTint, mode: .softLight)
```
