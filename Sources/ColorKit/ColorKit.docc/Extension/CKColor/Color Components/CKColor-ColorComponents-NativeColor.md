# ``ColorKit/CKColor/nativeColor``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("Native Color", style: symbol)
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

The underlying platform-specific color type.

## Overview

The `nativeColor` property returns the platform-specific representation of the color: `UIColor` on iOS/tvOS/watchOS/visionOS and `NSColor` on macOS. It preserves all dynamic resolution logic, allowing the color to adapt to light/dark modes and high-contrast settings at the platform level.

### Details

- **Type:** `NativeColor` (Alias for `UIColor` or `NSColor`).
- **Resolution:** Uses native system blocks (like `UIColor { traitCollection in ... }`) to ensure accurate dynamic behavior.

### Example Usage

```swift
import ColorKit

let ckColor = CKColor.red
let uiColor = ckColor.nativeColor // Accessing UIColor/NSColor
```
