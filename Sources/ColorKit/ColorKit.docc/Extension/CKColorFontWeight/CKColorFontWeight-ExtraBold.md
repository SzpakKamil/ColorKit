# ``ColorKit/CKColor/FontWeight/extraBold``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Extra Bold", style: symbol)
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

The extra bold font weight (800).

## Overview

Represents a font weight of 800.

### APCA Requirements

Under the default `silver` thresholds:
- **Medium (14pt+):** Requires at least 60 Lc.
- **Small (12pt+):** Requires at least 75 Lc.
- **Tiny (<12pt):** Requires at least 80 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let yellow = CKColor.yellow
let navy = CKColor(hexInt: 0x000044)

// Low Contrast Example
let isLowAccessible = yellow.isAPCAAccessible(on: bg, size: 12, weight: .extraBold)
// Result: false

// High Contrast Example
let isHighAccessible = navy.isAPCAAccessible(on: bg, size: 12, weight: .extraBold)
// Result: true
```
