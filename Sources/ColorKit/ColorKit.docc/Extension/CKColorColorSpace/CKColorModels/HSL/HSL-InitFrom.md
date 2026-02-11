# ``ColorKit/CKColor/HSL/init(from:)-(CKColor.RGBA)``

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

Creates an HSL structure from standard RGBA components.

## Overview

This initializer converts standard Red, Green, Blue, and Alpha components into the HSL coordinate system.

### Example Usage

```swift
import ColorKit

let rgba = CKColor.RGBA(r: 0.0, g: 0.0, b: 1.0, a: 1.0) // Blue
let hsl = CKColor.HSL(from: rgba)
// Result: h: 0.666 (240°), s: 1.0, l: 0.5
```
