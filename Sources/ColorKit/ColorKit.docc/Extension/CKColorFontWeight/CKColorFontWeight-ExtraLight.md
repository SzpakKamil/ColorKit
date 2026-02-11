# ``ColorKit/CKColor/FontWeight/extraLight``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Extra Light", style: symbol)
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

The extra light font weight (200).

## Overview

Represents a font weight of 200. Similar to ``thin``, this weight requires high contrast for legibility.

### APCA Requirements

Under the default `silver` thresholds:
- **Large (48pt+):** Requires at least 60 Lc.
- **Medium (36pt+):** Requires at least 75 Lc.
- **Body (<36pt):** Requires at least 90 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let gray = CKColor.gray
let darkBlue = CKColor(hexInt: 0x000088)

// Low Contrast Example
let isLowAccessible = gray.isAPCAAccessible(on: bg, size: 24, weight: .extraLight)
// Result: false

// High Contrast Example
let isHighAccessible = darkBlue.isAPCAAccessible(on: bg, size: 36, weight: .extraLight)
// Result: true
```
