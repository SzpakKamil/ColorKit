# ``ColorKit/CKColor/ColorSpace/adobeRGB``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("Adobe RGB", style: symbol)
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

Adobe RGB (1998) color space.

## Overview

The `adobeRGB` color space was designed by Adobe Systems to encompass most of the colors achievable on CMYK printers, while using RGB primaries. It provides a larger gamut than sRGB, particularly in the cyan-green tones.

### Details

- **Type:** Wide Gamut.
- **Transfer Function:** Gamma 2.2 (approx).
- **Usage:** Professional photography and print-related design.

### Example Usage

```swift
import ColorKit

// Initialize a color in Adobe RGB for photography workflows
let photoColor = CKColor(
    red: 0.0, 
    green: 1.0, 
    blue: 0.0, 
    colorSpace: .adobeRGB
)
```

### Credits

- **Reference:** Adobe Systems Incorporated, 2005.
