# ``ColorKit/CKColor/init(cgColor:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init CGColor", style: symbol)
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

Creates a `CKColor` from a Core Graphics color.

## Overview

This initializer allows you to bring low-level `CGColor` objects into the ColorKit ecosystem. It is particularly useful when working with Core Graphics drawing code, `CALayer` properties, or other lower-level framework APIs.

The initializer automatically inspects the `CGColorSpace` associated with the input. It extracts the raw components and maps them to the most appropriate internal ColorKit color space (such as `.sRGB`, `.displayP3`, or `.extendedSRGB`). This ensures that the technical precision of the original color—especially its gamut and bit-depth—is maintained during the transition to `CKColor`.

### Example Usage

#### Required Parameters
```swift
import CoreGraphics
import ColorKit

// Create a CGColor and wrap it in CKColor
let cgColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
let ckColor = CKColor(cgColor: cgColor)
```
