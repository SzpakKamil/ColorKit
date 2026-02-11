# ``ColorKit/CKColor/ColorSpace/rommRGB``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("ROMM RGB", style: symbol)
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

ROMM RGB (ProPhoto RGB) color space.

## Overview

The `rommRGB` color space (Reference Output Medium Metric RGB, also known as ProPhoto RGB) is an extremely wide-gamut color space. It is designed to include nearly all visible colors and is commonly used in professional high-bit-depth photography workflows.

### Details

- **Type:** Ultra-Wide Gamut.
- **Reference:** ISO 22028-2:2013.
- **Transfer Function:** Gamma 1.8.

### Example Usage

```swift
import ColorKit

// Initialize an ultra-wide gamut color
let wideColor = CKColor(
    red: 1.0, 
    green: 0.5, 
    blue: 0.0, 
    colorSpace: .rommRGB
)
```

### Credits

- **Reference:** ISO 22028-2:2013.
