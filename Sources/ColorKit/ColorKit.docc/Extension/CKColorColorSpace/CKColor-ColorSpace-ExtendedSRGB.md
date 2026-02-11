# ``ColorKit/CKColor/ColorSpace/extendedSRGB``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("Extended sRGB", style: symbol)
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

Extended sRGB color space (scRGB).

## Overview

The `extendedSRGB` color space (often referred to as scRGB) uses the IEC 61966-2-2:2003 standard. It allows for color values outside the typical 0.0 to 1.0 range, enabling the representation of HDR content and wide-gamut colors while still being compatible with sRGB primaries.

### Details

- **Type:** Non-linear, High Dynamic Range (HDR) capable.
- **Range:** Allows values < 0.0 and > 1.0.
- **Reference:** IEC 61966-2-2:2003.

### Example Usage

```swift
import ColorKit

// Initialize an scRGB color for HDR content
let scRgbColor = CKColor(
    red: 1.5, 
    green: 0.2, 
    blue: 0.2, 
    colorSpace: .extendedSRGB
)
```

### Credits

- **Reference:** IEC 61966-2-2:2003.
