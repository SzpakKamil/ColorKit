# ``ColorKit/CKColor/FontWeight/medium``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Medium", style: symbol)
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

The medium font weight (500).

## Overview

Represents a font weight of 500.

### APCA Requirements

Under the default `silver` thresholds:
- **Large (18pt+):** Requires at least 60 Lc.
- **Small (14pt+):** Requires at least 75 Lc.
- **Tiny (<14pt):** Requires at least 85 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let teal = CKColor.teal
let purple = CKColor.purple

// Low Contrast Example
let isLowAccessible = teal.isAPCAAccessible(on: bg, size: 14, weight: .medium)
// Result: false

// High Contrast Example
let isHighAccessible = purple.isAPCAAccessible(on: bg, size: 14, weight: .medium)
// Result: true
```
