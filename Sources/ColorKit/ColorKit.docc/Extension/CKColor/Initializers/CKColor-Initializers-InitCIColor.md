# ``ColorKit/CKColor/init(ciColor:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init CIColor", style: symbol)
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

Creates a `CKColor` from a Core Image color.

## Overview

This initializer facilitates integration with Core Image filtering and image processing pipelines. It converts a `CIColor`—which often represents color data in a high-precision, linear color space—into a dynamic `CKColor`.

The conversion process respects the original color's components and transparency. Because `CIColor` is commonly used in hardware-accelerated processing, this initializer ensures that the resulting `CKColor` is ready for further perceptual modifications or direct rendering in SwiftUI.

> Note: `CIColor` support is not available on watchOS within ColorKit.

### Example Usage

#### Required Parameters
```swift
import CoreImage
import ColorKit

// Initialize from a CIColor used in image processing
let ciColor = CIColor(red: 0, green: 1, blue: 0)
let ckColor = CKColor(ciColor: ciColor)
```
