# ``ColorKit/CKColor/cgColor``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("CG Color", style: symbol)
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

The Core Graphics representation of the color.

## Overview

The `cgColor` property provides the `CGColor` representation of the underlying native color. This is particularly useful when working with Core Graphics, Core Animation layers, or other low-level drawing APIs.

### Details

- **Type:** `CGColor`.
- **Behavior:** Returns the `cgColor` property of the ``ColorKit/CKColor/nativeColor``.

### Example Usage

```swift
import ColorKit
import QuartzCore

let color = CKColor.blue
let layer = CALayer()
layer.backgroundColor = color.cgColor
```
