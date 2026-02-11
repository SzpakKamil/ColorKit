# ``SwiftUICore/Color/init(L:C:h:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Init LCH", style: symbol)
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

Creates a SwiftUI `Color` from CIE LCH components.

## Overview

Allows creating a SwiftUI `Color` using intuitive LCH (Lightness, Chroma, Hue) coordinates. This coordinate system is highly effective for programmatically generating harmonious color palettes.

### Parameters

- `L`: Lightness component.
- `C`: Chroma (intensity) component.
- `h`: Hue angle, typically from `0.0` to `360.0` degrees.
- `opacity`: The alpha value of the color, from `0.0` to `1.0`.
- `headroom`: An optional multiplier for High Dynamic Range (HDR) peak brightness.
- `colorSpace`: The working color space used for initial processing. Defaults to ``ColorKit/CKColor/ColorSpace/lch``.

### Example Usage

```swift
import SwiftUI
import ColorKit

let color = Color(L: 50.0, C: 100.0, h: 40.0)
```
