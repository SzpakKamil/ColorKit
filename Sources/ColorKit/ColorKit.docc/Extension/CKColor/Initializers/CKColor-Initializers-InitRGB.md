# ``ColorKit/CKColor/init(red:green:blue:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init RGB", style: symbol)
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

Creates a `CKColor` from raw RGB components.

## Overview

This is the fundamental initializer for creating colors from their constituent red, green, and blue components. Components should be provided as normalized floating-point values, typically ranging from `0.0` to `1.0`.

A key feature of this initializer is its support for **Extended Dynamic Range (HDR)**. By providing a `headroom` value greater than `1.0` and selecting a compatible color space like `.displayP3`, you can define colors that exceed standard brightness levels on supported hardware. This makes it an essential tool for high-end UI design and media-rich applications.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Create a basic sRGB color
let ckColor = CKColor(red: 1.0, green: 0.0, blue: 0.0) // Pure Red
```

#### Full Initialization
```swift
import ColorKit

// Create an HDR-ready color in the Display P3 color space
let ckColor = CKColor(
    red: 1.0,
    green: 0.0,
    blue: 0.0,
    opacity: 0.8,
    headroom: 2.5, // High Dynamic Range support
    colorSpace: .displayP3
)
```
