# ``ColorKit/CKColor/rgbComponents()``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("RGB Components", style: symbol)
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

Returns the RGBA components of the color.

## Overview

The `rgbComponents()` function returns the raw Red, Green, Blue, and Alpha values of the color's primary variant.

### Details

- **Return Value:** A ``CKColor/RGBA`` struct containing the components.
- **Fallbacks:** Returns black (0,0,0,1) if components cannot be resolved.

### Example Usage

```swift
import ColorKit

let color = CKColor.blue
let components = color.rgbComponents()
print(components.r, components.g, components.b, components.a)
```
