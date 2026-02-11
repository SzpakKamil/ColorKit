# ``ColorKit/CKColor/debugDescription``

@Metadata {
    @TitleHeading("Description Properties")
    @DisplayName("Debug Description", style: symbol)
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

A detailed representation of the color for debugging.

## Overview

The `debugDescription` property returns a string containing the color's primary and secondary identifiers along with its color space. This is useful for identifying specific color configurations during development.

### Details

- **Protocol:** `CustomDebugStringConvertible`
- **Return Value:** A string formatted as `CKColor(id: [primary]-[secondary], space: [space_name])`.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
print(String(reflecting: color)) // e.g., "CKColor(id: 123456-7890, space: sRGB)"
```
