# ``CoreGraphics/CGColor/ckColor``

@Metadata {
    @TitleHeading("Core Graphics Extensions")
    @DisplayName("CKColor Bridge", style: symbol)
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
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Converts a Core Graphics color to a `CKColor`.

## Overview

The `ckColor` property allows low-level `CGColor` objects to be converted into the ColorKit format.

### Purpose

This bridge is essential when working with layers (`CALayer`), standard drawing contexts, or other frameworks that return `CGColor`. It automatically handles the conversion from the source `CGColorSpace` into ColorKit's working representation.

### Example Usage

```swift
import CoreGraphics
import ColorKit

let cgColor = CGColor(gray: 0.5, alpha: 1.0)
let ckColor = cgColor.ckColor
```
