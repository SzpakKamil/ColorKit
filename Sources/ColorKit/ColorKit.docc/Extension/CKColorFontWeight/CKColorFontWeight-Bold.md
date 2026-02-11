# ``ColorKit/CKColor/FontWeight/bold``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Bold", style: symbol)
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

The bold font weight (700).

## Overview

Represents a font weight of 700. Bold text has lower spatial frequency and is easier to read at lower contrast levels.

### APCA Requirements

Under the default `silver` thresholds:
- **Medium (14pt+):** Requires at least 60 Lc.
- **Small (12pt+):** Requires at least 75 Lc.
- **Tiny (<12pt):** Requires at least 80 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let red = CKColor.red
let darkGray = CKColor(hexInt: 0x333333)

// Low Contrast Example (Red on White is surprisingly low contrast for APCA)
let isLowAccessible = red.isAPCAAccessible(on: bg, size: 12, weight: .bold)
// Result: false

// High Contrast Example
let isHighAccessible = darkGray.isAPCAAccessible(on: bg, size: 12, weight: .bold)
// Result: true
```
