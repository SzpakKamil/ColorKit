# ``ColorKit/CKColor/FontWeight/black``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Black", style: symbol)
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

The black font weight (900).

## Overview

Represents a font weight of 900. This is the heaviest available weight and provides the highest legibility at lower contrast levels.

### APCA Requirements

Under the default `silver` thresholds:
- **Medium (14pt+):** Requires at least 60 Lc.
- **Small (12pt+):** Requires at least 75 Lc.
- **Tiny (<12pt):** Requires at least 80 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let pink = CKColor.pink
let black = CKColor.black

// Low Contrast Example
let isLowAccessible = pink.isAPCAAccessible(on: bg, size: 12, weight: .black)
// Result: false

// High Contrast Example
let isHighAccessible = black.isAPCAAccessible(on: bg, size: 12, weight: .black)
// Result: true
```
