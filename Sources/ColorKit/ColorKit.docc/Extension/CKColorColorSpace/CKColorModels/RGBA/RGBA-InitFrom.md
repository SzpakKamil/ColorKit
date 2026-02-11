# ``ColorKit/CKColor/RGBA/init(from:)-(CKColor.RGBA)``

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

Creates a new RGBA structure from another RGBA instance.

## Overview

This initializer creates a copy of an existing `RGBA` instance, preserving all channel values and HDR headroom.

### Example Usage

```swift
import ColorKit

let original = CKColor.RGBA(r: 1.0, g: 0.0, b: 0.0, a: 1.0)
let copy = CKColor.RGBA(from: original)
```
