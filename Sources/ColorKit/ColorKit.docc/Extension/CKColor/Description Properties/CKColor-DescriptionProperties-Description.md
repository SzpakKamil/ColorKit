# ``ColorKit/CKColor/description``

@Metadata {
    @TitleHeading("Description Properties")
    @DisplayName("Description", style: symbol)
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

A textual representation of the color.

## Overview

The `description` property returns the internal key used to identify the color. For standard colors, it returns a key like `ColorKit.Red`. For custom colors, it returns `ColorKit.CustomColor`.

### Details

- **Protocol:** `CustomStringConvertible`
- **Return Value:** A non-localized string key representing the color identity.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
print(color.description) // Prints: "ColorKit.Red"
```
