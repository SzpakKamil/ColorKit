# ``ColorKit/CKColor/ColorSpace/cmyk``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("CMYK", style: symbol)
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

CMYK color model representation.

## Overview

The `cmyk` case represents the subtractive color model used in color printing. It defines colors using Cyan, Magenta, Yellow, and Key (Black) components. In ColorKit, this is internally resolved using sRGB primaries for digital display.

### Details

- **Axes:** Cyan, Magenta, Yellow, Black (0-1).
- **Usage:** Digital representation of print-oriented color values.

### Example Usage

```swift
import ColorKit

// Initialize a color using CMYK print values
let color = CKColor(
    cyan: 1.0, 
    magenta: 0.0, 
    yellow: 0.0, 
    key: 0.0, 
    colorSpace: .cmyk
)
```
