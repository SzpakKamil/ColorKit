# ``ColorKit/CKColor/lchComponents()``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("LCH Components", style: symbol)
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

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticArticleSubheading(disabled)
}

Returns the CIE LCH components of the color.

## Overview

The `lchComponents()` function converts the color's primary components to the LCH (Lightness, Chroma, Hue) color space, which is a cylindrical representation of CIE LAB.

### Details

- **Return Value:** A ``CKColor/LCH`` struct.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
let lch = color.lchComponents()
print("L: \(lch.L), C: \(lch.C), h: \(lch.h)")
```
