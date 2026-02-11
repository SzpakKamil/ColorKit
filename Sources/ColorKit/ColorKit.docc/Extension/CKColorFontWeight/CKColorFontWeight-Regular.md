# ``ColorKit/CKColor/FontWeight/regular``

@Metadata {
    @TitleHeading("Font Weights")
    @DisplayName("Regular", style: symbol)
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

The regular font weight (400).

## Overview

Represents a font weight of 400. This is the standard weight used for most body text.

### APCA Requirements

Under the default `silver` thresholds:
- **Large (24pt+):** Requires at least 60 Lc.
- **Medium (18pt+):** Requires at least 75 Lc.
- **Body (<18pt):** Requires at least 90 Lc.

### Accessibility Examples

```swift
let bg = CKColor.white
let orange = CKColor.orange
let black = CKColor.black

// Low Contrast Example (Orange on White is often hard to read)
let isLowAccessible = orange.isAPCAAccessible(on: bg, size: 16, weight: .regular)
// Result: false

// High Contrast Example
let isHighAccessible = black.isAPCAAccessible(on: bg, size: 16, weight: .regular)
// Result: true
```
