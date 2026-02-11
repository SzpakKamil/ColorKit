# ``ColorKit/CKColor/colorSpace``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("Color Space", style: symbol)
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

The working color space of the color.

## Overview

The `colorSpace` property indicates the color space in which the color's components are defined and where color math (like blending and conversion) is performed.

### Details

- **Type:** ``CKColor/ColorSpace``
- **Importance:** Accurate color space tracking prevents color shifts during processing and allows for wide-gamut (P3) and HDR support.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
print(color.colorSpace) // e.g., .sRGB
```
