# ``ColorKit/CKColor/ciColor``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("CI Color", style: symbol)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "13.0")
    @Available(iPadOS, introduced: "13.0")
    @Available(macOS, introduced: "10.15")
    @Available(tvOS, introduced: "13.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticArticleSubheading(disabled)
}

The Core Image representation of the color.

## Overview

The `ciColor` property returns a `CIColor` object created from the underlying native color. This is useful for integrating with Core Image filters or other image processing workflows.

### Details

- **Type:** `CIColor`.
- **Availability:** This property is available on platforms where Core Image is supported.
- **Fallbacks:** Returns a `CIColor` representation of the ``ColorKit/CKColor/nativeColor``.

### Example Usage

```swift
import ColorKit
import CoreImage

let color = CKColor.red
let ciColor = color.ciColor
// Use ciColor in a CIFilter
```
