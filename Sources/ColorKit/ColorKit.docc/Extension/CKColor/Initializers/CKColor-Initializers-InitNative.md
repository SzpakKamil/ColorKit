# ``ColorKit/CKColor/init(nativeColor:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init Native", style: symbol)
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

Creates a `CKColor` from a platform-specific native color.

## Overview

This initializer acts as the primary bridge for platform-native APIs, accepting `UIColor` on iOS, tvOS, and watchOS, or `NSColor` on macOS. It is designed to preserve the full dynamic nature of system colors.

When provided with a native color, this initializer resolves its components across all supported system traits, including light/dark appearance and high-contrast accessibility settings. Furthermore, it cross-references the resolved color against ColorKit's internal registry. If a match is found for a standard system color (like `systemRed`), it creates an optimized representation that continues to adapt to platform-level system changes.

### Example Usage

#### Required Parameters
```swift
#if canImport(UIKit)
import UIKit
import ColorKit

// Initialize from a system-defined UIColor
let ckColor = CKColor(nativeColor: UIColor.systemBlue)
#elseif canImport(AppKit)
import AppKit
import ColorKit

// Initialize from a system-defined NSColor
let ckColor = CKColor(nativeColor: NSColor.systemBlue)
#endif
```
