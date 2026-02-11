# ``SwiftUICore/Color/init(cyan:magenta:yellow:key:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Init CMYK", style: symbol)
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

Creates a SwiftUI `Color` from CMYK components.

## Overview

Brings print-oriented CMYK color definitions directly into SwiftUI. ColorKit handles the conversion to the digital RGB space while preserving component precision.

### Parameters

- `cyan`: The cyan component intensity, from `0.0` to `1.0`.
- `magenta`: The magenta component intensity, from `0.0` to `1.0`.
- `yellow`: The yellow component intensity, from `0.0` to `1.0`.
- `key`: The black (key) component intensity, from `0.0` to `1.0`.
- `opacity`: The alpha value of the color, from `0.0` to `1.0`.
- `headroom`: An optional multiplier for High Dynamic Range (HDR) peak brightness.
- `colorSpace`: The working color space used for initial processing. Defaults to ``ColorKit/CKColor/ColorSpace/cmyk``.

### Example Usage

```swift
import SwiftUI
import ColorKit

let color = Color(cyan: 1.0, magenta: 0.0, yellow: 0.0, key: 0.0)
```
