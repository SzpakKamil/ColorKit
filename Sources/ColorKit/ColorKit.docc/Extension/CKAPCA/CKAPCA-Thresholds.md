# ``ColorKit/CKAPCA/Thresholds``

@Metadata {
    @TitleHeading("APCA")
    @DisplayName("Thresholds", style: symbol)
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

Lookup tables for accessibility compliance thresholds.

## Overview

The `Thresholds` struct defines the minimum required Lightness Contrast (`Lc`) for a specific combination of font size and weight. 

### Purpose

Typographic accessibility is not linear; smaller or thinner text requires much more contrast than large, bold text. The purpose of `Thresholds` is to formalize this relationship into a lookup table, allowing ColorKit to provide accurate "pass/fail" results for specific design configurations.

### Topics

- ``silver``
- ``init(lookup:)``

### Example Usage

```swift
import ColorKit

// Use the standard silver thresholds
let standard = CKAPCA.Thresholds.silver

// Access the lookup logic
let requiredContrast = standard.lookup(16.0, .regular)
```
