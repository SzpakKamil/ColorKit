# ``ColorKit/CKColor/apcaContrast(on:)``

@Metadata {
    @TitleHeading("Contrast (WCAG)")
    @DisplayName("APCA Contrast", style: symbol)
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

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticArticleSubheading(disabled)
}

Calculates the APCA Lightness Contrast (Lc) value.

## Overview

The `apcaContrast(on:)` function uses the Advanced Perceptual Contrast Algorithm (APCA), which is the foundation for modern accessibility standards like WCAG 3.0. 

### Purpose

The purpose of APCA is to provide a more accurate representation of how humans actually perceive contrast compared to legacy formulas. It is specifically designed to handle modern wide-gamut and HDR displays, and it correctly identifies that light text on dark backgrounds requires different contrast levels than dark text on light backgrounds.

### Details

- **Parameters:**
  - `background`: The color of the background layer.
- **Return Value:** An `Lc` value typically between -108 and +106.
  - **Negative Values:** Indicate dark text on a light background.
  - **Positive Values:** Indicate light text on a dark background.

### Example Usage

```swift
import ColorKit

let bg = CKColor.white
let txt = CKColor.black

let lc = txt.apcaContrast(on: bg)
print("Perceptual Contrast (Lc): \(lc)") // approx -106.0
```
