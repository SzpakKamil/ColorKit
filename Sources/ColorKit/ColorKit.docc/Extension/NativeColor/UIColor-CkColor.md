# ``UIKit/UIColor/ckColor``

@Metadata {
    @TitleHeading("Native Extensions")
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
    @AutomaticArticleSubheading(disabled)
}

Converts a platform-native color to a dynamic `CKColor`.

## Overview

The `ckColor` property on `UIColor` and `NSColor` provides a convenient way to bring platform-native colors into the ColorKit ecosystem.

### Purpose

This bridge is designed to preserve the full dynamic nature of system colors. When you call `.ckColor` on a native color, it automatically resolves its components across different system appearances (like dark mode and high contrast) and creates a `CKColor` instance that maintains these adaptive traits.

### Example Usage

```swift
#if canImport(UIKit)
import UIKit
import ColorKit

let systemColor = UIColor.systemRed
let dynamicCKColor = systemColor.ckColor
#endif
```
