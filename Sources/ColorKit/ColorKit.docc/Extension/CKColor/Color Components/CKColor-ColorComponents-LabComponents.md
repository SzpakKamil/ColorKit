# ``ColorKit/CKColor/labComponents()``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("LAB Components", style: symbol)
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

Returns the CIE LAB components of the color.

## Overview

The `labComponents()` function converts the color's primary components to the CIE LAB color space, which is designed to be perceptually uniform.

### Details

- **Return Value:** A ``CKColor/LAB`` struct.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
let lab = color.labComponents()
print("L: \(lab.L), a: \(lab.a), b: \(lab.b)")
```
