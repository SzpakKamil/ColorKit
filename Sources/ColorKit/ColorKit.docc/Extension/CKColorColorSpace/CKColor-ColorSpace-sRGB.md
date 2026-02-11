# ``ColorKit/CKColor/ColorSpace/sRGB``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("sRGB", style: symbol)
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

Standard RGB color space.

## Overview

The `sRGB` (Standard Red Green Blue) color space is the default for most digital displays and the web. It uses the IEC 61966-2-1:1999 standard and provides a consistent way to represent colors across different devices.

### Details

- **Type:** Standard dynamic range (SDR).
- **Transfer Function:** Non-linear (Gamma ~2.2).
- **Gamut:** Standard gamut suitable for most web and mobile applications.

### Example Usage

```swift
import ColorKit

// Initialize a CKColor explicitly using the sRGB color space
let color = CKColor(
    red: 1.0, 
    green: 0.5, 
    blue: 0.0, 
    colorSpace: .sRGB
)
```

### Credits

- **Reference:** IEC 61966-2-1:1999 "Multimedia systems and equipment - Colour measurement and management - Part 2-1: Colour management - Default RGB colour space - sRGB".
