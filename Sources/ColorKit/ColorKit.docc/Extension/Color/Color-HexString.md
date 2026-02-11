# ``SwiftUICore/Color/hexString``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Hex String", style: symbol)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(tvOS, introduced: "14.0")
    @Available(watchOS, introduced: "7.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

An 8-character hex representation of the color.

## Overview

The `hexString` property returns a hexadecimal string in the format `#RRGGBBAA`. This value is derived from the color's dynamic RGB components by resolving them through ColorKit's bridging logic.

### Example Usage

```swift
import SwiftUI
import ColorKit

let color = Color.blue
print(color.hexString) // e.g., "#0000FFFF"
```
