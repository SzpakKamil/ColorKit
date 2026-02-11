# ``ColorKit/CKColor/init(hue:saturation:lightness:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init HSL", style: symbol)
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

Creates a `CKColor` from HSL components.

## Overview

This initializer creates a color using the Hue, Saturation, and Lightness (HSL) model. HSL is often more intuitive for designers and developers when adjusting color variations, such as creating tints or shades.

The initializer maps the HSL coordinates into the ColorKit internal representation. It also supports advanced features like opacity and HDR headroom, allowing you to create high-precision colors using a coordinate system that is easier to reason about than raw RGB.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Create a color using HSL coordinates
let ckColor = CKColor(hue: 0.0, saturation: 1.0, lightness: 0.5) // Pure Red
```

#### Full Initialization
```swift
import ColorKit

// Define a color with HSL, specifying opacity and a custom color space
let ckColor = CKColor(
    hue: 240.0,
    saturation: 1.0,
    lightness: 0.5,
    opacity: 1.0,
    headroom: nil,
    colorSpace: .hsl
)
```
