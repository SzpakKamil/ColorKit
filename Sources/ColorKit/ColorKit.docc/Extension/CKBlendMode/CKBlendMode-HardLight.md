# ``ColorKit/CKBlendMode/hardLight``

@Metadata {
    @TitleHeading("Blend Modes")
    @DisplayName("Hard Light", style: symbol)
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

The hard light blend mode.

## Overview

Creates a harsh lighting effect based on the blend color.

### Effect

The effect is similar to shining a harsh, focused spotlight on the base color. It uses either `multiply` or `screen` logic depending on the brightness of the **blend color** (unlike `overlay`, which looks at the base color). It is useful for creating intense highlights or deep shadows with a sharp transition.

### Example Usage

```swift
import ColorKit

let base = CKColor.red
let spotlight = CKColor.white.opacity(0.5)

let result = base.blended(with: spotlight, mode: .hardLight)
```
