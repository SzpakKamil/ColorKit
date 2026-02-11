# ``SwiftUICore/Color/init(okL:okA:okB:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Init OKLAB", style: symbol)
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

Creates a SwiftUI `Color` from OKLAB components.

## Overview

Enables the use of the modern OKLAB perceptual color space when defining SwiftUI colors. OKLAB is designed to be perceptually accurate and is ideal for creating smooth gradients and natural color transformations.

### Parameters

- `okL`: Perceptual lightness component.
- `okA`: Green–Red opponent axis.
- `okB`: Blue–Yellow opponent axis.
- `opacity`: The alpha value of the color, from `0.0` to `1.0`.
- `headroom`: An optional multiplier for High Dynamic Range (HDR) peak brightness.
- `colorSpace`: The working color space used for initial processing. Defaults to ``ColorKit/CKColor/ColorSpace/okLab``.

### Example Usage

```swift
import SwiftUI
import ColorKit

let color = Color(okL: 0.6, okA: 0.2, okB: 0.1)
```
