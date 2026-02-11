# ``ColorKit/CKColor/FontWeight/thin``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Thin", style: symbol)
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

The thin font weight (100).

## Overview

Represents a font weight of 100. This is the lightest available weight and presents the highest spatial frequency, making it the most difficult to read.

### APCA Requirements

Under the default `silver` thresholds, thin text requires significantly higher contrast to remain accessible:
- **Large (48pt+):** Requires at least 60 Lc.
- **Medium (36pt+):** Requires at least 75 Lc.
- **Body (<36pt):** Requires at least 90 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let lightGray = CKColor(hexInt: 0xAAAAAA)
let black = CKColor.black

// Low Contrast Example (Fails for Thin)
let isLowAccessible = lightGray.isAPCAAccessible(on: bg, size: 18, weight: .thin) 
// Result: false (Thin text needs much more contrast at small sizes)

// High Contrast Example (Passes for Thin)
let isHighAccessible = black.isAPCAAccessible(on: bg, size: 48, weight: .thin)
// Result: true (Passes because size is large and contrast is maximum)
```
