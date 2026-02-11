# ``ColorKit/CKColor/ColorSpace/displayP3``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("Display P3", style: symbol)
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

Wide gamut Display P3 color space.

## Overview

The `displayP3` color space is a wide-gamut RGB space developed by Apple. It uses DCI-P3 primaries but with a D65 white point and the sRGB transfer function. It can represent more vibrant colors—especially greens and reds—than standard sRGB.

### Details

- **Type:** Wide Gamut.
- **Reference:** SMPTE RP 431-2:2011 / Apple Inc.
- **Support:** Native on modern Apple displays.

### Example Usage

```swift
import ColorKit

// Initialize a vibrant P3 color
let p3Color = CKColor(
    red: 1.0, 
    green: 0.0, 
    blue: 0.0, 
    colorSpace: .displayP3
)
```

### Credits

- **Reference:** SMPTE RP 431-2:2011 / Apple Inc.
