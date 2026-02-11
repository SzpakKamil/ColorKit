# ``ColorKit/CKColor/hexString``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("Hex String", style: symbol)
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

An 8-character hex representation of the color.

## Overview

The `hexString` property returns a hexadecimal string in the format `#RRGGBBAA`. This value is derived from the color's primary RGB components.

### Details

- **Format:** `#` followed by 8 hexadecimal characters.
- **Components:** Includes Red, Green, Blue, and Alpha channels.

### Example Usage

```swift
import ColorKit

let color = CKColor.blue.opacity(0.5)
print(color.hexString) // e.g., "#0000FF7F"
```
