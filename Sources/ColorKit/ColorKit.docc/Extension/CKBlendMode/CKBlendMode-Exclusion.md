# ``ColorKit/CKBlendMode/exclusion``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Exclusion", style: symbol)
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

The exclusion blend mode.

## Overview

A lower-contrast version of the `difference` mode.

### Effect

Like `difference`, blending with white inverts the base color, and blending with black has no effect. However, the mathematical formula ($B + S - 2BS$) ensures that the transition between colors is smoother and the overall contrast is reduced compared to the absolute difference.

- **Formula:** $B + S - 2 \times B \times S$

### Example Usage

```swift
import ColorKit

let base = CKColor.white
let blend = CKColor.red

// The result will be a muted Cyan
let result = base.blended(with: blend, mode: .exclusion)
```
