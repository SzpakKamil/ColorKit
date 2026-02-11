# ``SwiftUICore/Color/init(L:a:b:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Init LAB", style: symbol)
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

Creates a SwiftUI `Color` from CIE LAB components.

## Overview

Allows creating a SwiftUI `Color` using perceptually uniform LAB coordinates. This ensures that mathematical adjustments to the color result in predictable visual changes.

### Parameters

- `L`: Lightness value, typically from `0.0` to `100.0`.
- `a`: Green–Red opponent axis.
- `b`: Blue–Yellow opponent axis.
- `opacity`: The alpha value of the color, from `0.0` to `1.0`.
- `headroom`: An optional multiplier for High Dynamic Range (HDR) peak brightness.
- `colorSpace`: The working color space used for initial processing. Defaults to ``ColorKit/CKColor/ColorSpace/lab``.

### Example Usage

```swift
import SwiftUI
import ColorKit

let color = Color(L: 50.0, a: 100.0, b: 50.0)
```
