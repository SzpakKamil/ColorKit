# ``ColorKit/CKColor/okLabComponents()``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("OKLAB Components", style: symbol)
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

Returns the OKLAB components of the color.

## Overview

The `okLabComponents()` function converts the color's primary components to the OKLAB color space, a modern perceptual color space optimized for image processing and UI design.

### Details

- **Return Value:** An ``CKColor/OKLAB`` struct.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
let okLab = color.okLabComponents()
print("L: \(okLab.L), a: \(okLab.a), b: \(okLab.b)")
```
