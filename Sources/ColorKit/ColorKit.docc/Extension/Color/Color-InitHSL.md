# ``SwiftUICore/Color/init(hue:saturation:lightness:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Init HSL", style: symbol)
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

Creates a SwiftUI `Color` from HSL components.

## Overview

This initializer provides a convenient way to create a standard SwiftUI `Color` using Hue, Saturation, and Lightness coordinates. It leverages ColorKit's HSL model internally before bridging back to SwiftUI.

### Parameters

- `hue`: The hue angle of the color, normalized from `0.0` to `1.0` (mapping to 0° to 360°).
- `saturation`: The intensity of the color, from `0.0` (grayscale) to `1.0` (full color).
- `lightness`: The brightness of the color, from `0.0` (black) to `1.0` (white).
- `opacity`: The alpha value of the color, from `0.0` (transparent) to `1.0` (opaque).
- `headroom`: An optional multiplier for High Dynamic Range (HDR) peak brightness.
- `colorSpace`: The working color space used for initial processing. Defaults to ``ColorKit/CKColor/ColorSpace/hsl``.

### Example Usage

```swift
import SwiftUI
import ColorKit

let color = Color(hue: 0.0, saturation: 1.0, lightness: 0.5) // Red
```
