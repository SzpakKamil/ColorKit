# ``SwiftUICore/Color/components(as:)``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Components As", style: symbol)
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

Returns the components of this color in the specified model format.

## Overview

The `components(as:)` method allows you to extract mathematical representations of a SwiftUI `Color` in various color models (like HSL, LAB, or CMYK). It bridges the color to ColorKit and performs the necessary transformations.

### Parameters

- `type`: The type of the color model to convert to (e.g., `CKColor.HSL.self`).

### Return Value

An instance of the requested model conforming to ``ColorKit/CKModel``.

### Example Usage

```swift
import SwiftUI
import ColorKit

let color = Color.red
let hsl = color.components(as: CKColor.HSL.self)
print("Hue: \(hsl.h), Saturation: \(hsl.s), Lightness: \(hsl.l)")
```
