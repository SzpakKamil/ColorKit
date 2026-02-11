# ``ColorKit/CKColor/CMYK/init(from:)-(CKColor.RGBA)``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("Init from RGBA", style: symbol)
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

Creates a CMYK structure from standard RGBA components.

## Overview

Converts additive light components (RGB) into subtractive print components (CMYK).

### Example Usage

```swift
import ColorKit

let rgba = CKColor.RGBA(r: 1.0, g: 1.0, b: 0.0, a: 1.0) // Yellow
let cmyk = CKColor.CMYK(from: rgba)
// Result: c: 0.0, m: 0.0, y: 1.0, k: 0.0
```
