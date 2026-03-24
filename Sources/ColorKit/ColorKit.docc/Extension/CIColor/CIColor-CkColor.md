# ``CoreImage/CIColor/ckColor``

@Metadata {
    @TitleHeading("Core Image Extensions")
    @DisplayName("CKColor Bridge", style: symbol)
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

Converts a Core Image color to a `CKColor`.

## Overview

Use `ckColor` to bridge `CIColor` to ColorKit for Core Image workflows.

### Purpose

Analyze or modify colors from filters or pipelines using ColorKit's perceptual models. This bridge connects high-precision image processing to UI-focused color manipulation.

> Note: Unavailable on watchOS.

### Example Usage

```swift
import CoreImage
import ColorKit

let ciColor = CIColor(red: 0.5, green: 1.0, blue: 0.0)
let ckColor = ciColor.ckColor
```
