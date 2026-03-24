# ``ColorKit/CKColor/ColorSpace/okLab``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("OKLAB", style: symbol)
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

OKLAB perceptual color space.

## Overview

The `okLab` case represents the modern OKLAB perceptual color space. It is easier to use and more perceptually accurate than CIE LAB, particularly for image processing tasks like gradients and blending, as it avoids common hueshift artifacts.

### Details

- **Type:** Modern Perceptual.
- **Reference:** Björn Ottosson (2020).
- **Usage:** Primary space for perceptual operations in ColorKit.

### Example Usage

```swift
import ColorKit

// Initialize a color using the modern OKLAB model
let color = CKColor(
    okL: 0.6, 
    okA: 0.2, 
    okB: 0.1, 
    colorSpace: .okLab
)
```

### Credits

- **Reference:** Björn Ottosson, "A perceptual color space for image processing" (2020).
