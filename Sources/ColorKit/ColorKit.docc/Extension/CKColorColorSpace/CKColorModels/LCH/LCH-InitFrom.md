# ``ColorKit/CKColor/LCH/init(from:)-(CKColor.RGBA)``

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

Creates an LCH structure from standard RGBA components.

## Overview

Converts standard components into the cylindrical LCH (Lightness, Chroma, Hue) space by first calculating the rectangular LAB coordinates.

### Example Usage

```swift
import ColorKit

let rgba = CKColor.RGBA(r: 1.0, g: 0.5, b: 0.0, a: 1.0)
let lch = CKColor.LCH(from: rgba)
```
