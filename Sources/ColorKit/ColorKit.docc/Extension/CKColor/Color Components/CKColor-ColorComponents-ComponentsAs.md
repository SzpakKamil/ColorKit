# ``ColorKit/CKColor/components(as:)``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("Components As", style: symbol)
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

Returns color components in a specified model format.

## Overview

The `components(as:)` function converts the color's primary components into any model that conforms to the ``ColorKit/CKModel`` protocol (e.g., HSL, CMYK, LAB).

### Details

- **Parameters:**
  - `type`: The model type to convert to (e.g., `HSL.self`).
- **Return Value:** An instance of the requested model containing the converted components.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
let hsl = color.components(as: CKColor.HSL.self)
print("Hue: \(hsl.h), Saturation: \(hsl.s), Lightness: \(hsl.l)")
```
