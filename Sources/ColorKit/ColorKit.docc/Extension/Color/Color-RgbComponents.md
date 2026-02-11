# ``SwiftUICore/Color/rgbComponents()``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("RGB Components", style: symbol)
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

Returns the RGBA components of the SwiftUI color.

## Overview

A convenience method to quickly access the Red, Green, Blue, and Alpha channels of a SwiftUI `Color`.

### Return Value

A ``ColorKit/CKColor/RGBA`` struct containing the normalized component values.

### Example Usage

```swift
import SwiftUI
import ColorKit

let color = Color.blue
let components = color.rgbComponents()
print("Red: \(components.r), Green: \(components.g), Blue: \(components.b)")
```
