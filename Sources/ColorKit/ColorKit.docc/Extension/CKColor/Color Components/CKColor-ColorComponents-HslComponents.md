# ``ColorKit/CKColor/hslComponents()``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("HSL Components", style: symbol)
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

Returns the HSL components of the color.

## Overview

The `hslComponents()` function is a convenience method that converts the color's primary components to the HSL (Hue, Saturation, Lightness) model.

### Details

- **Return Value:** A ``CKColor/HSL`` struct.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
let hsl = color.hslComponents()
print(hsl.h, hsl.s, hsl.l)
```
