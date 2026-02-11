# ``ColorKit/CKColor/OKLAB/init(from:)-(CKColor.RGBA)``

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

Creates an OKLAB structure from standard RGBA components.

## Overview

Converts sRGB components into the modern OKLAB perceptual space using Björn Ottosson's matrices and cube-root transformations.

### Example Usage

```swift
import ColorKit

let rgba = CKColor.RGBA(r: 0.5, g: 0.8, b: 0.2, a: 1.0)
let okLab = CKColor.OKLAB(from: rgba)
```
