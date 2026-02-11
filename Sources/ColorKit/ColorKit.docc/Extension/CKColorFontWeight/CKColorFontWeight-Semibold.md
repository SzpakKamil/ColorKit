# ``ColorKit/CKColor/FontWeight/semibold``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Semibold", style: symbol)
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

The semibold font weight (600).

## Overview

Represents a font weight of 600.

### APCA Requirements

Under the default `silver` thresholds:
- **Large (18pt+):** Requires at least 60 Lc.
- **Small (14pt+):** Requires at least 75 Lc.
- **Tiny (<14pt):** Requires at least 85 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let cyan = CKColor.cyan
let brown = CKColor.brown

// Low Contrast Example
let isLowAccessible = cyan.isAPCAAccessible(on: bg, size: 14, weight: .semibold)
// Result: false

// High Contrast Example
let isHighAccessible = brown.isAPCAAccessible(on: bg, size: 14, weight: .semibold)
// Result: true
```
