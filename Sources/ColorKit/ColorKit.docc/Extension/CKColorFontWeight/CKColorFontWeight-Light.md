# ``ColorKit/CKColor/FontWeight/light``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Light", style: symbol)
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

The light font weight (300).

## Overview

Represents a font weight of 300.

### APCA Requirements

Under the default `silver` thresholds:
- **Large (36pt+):** Requires at least 60 Lc.
- **Medium (24pt+):** Requires at least 75 Lc.
- **Body (<24pt):** Requires at least 90 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let midGray = CKColor(hexInt: 0x777777)
let indigo = CKColor.indigo

// Low Contrast Example
let isLowAccessible = midGray.isAPCAAccessible(on: bg, size: 16, weight: .light)
// Result: false

// High Contrast Example
let isHighAccessible = indigo.isAPCAAccessible(on: bg, size: 24, weight: .light)
// Result: true
```
