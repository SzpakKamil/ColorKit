# ``ColorKit/CKColor/isAPCAAccessible(on:size:weight:)``

@Metadata {
    @TitleHeading("Contrast (WCAG)")
    @DisplayName("Is APCA Accessible", style: symbol)
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

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticArticleSubheading(disabled)
}

Determines if a text/background color pairing is accessible under APCA.

## Overview

The `isAPCAAccessible(on:size:weight:)` function provides a high-level check for modern accessibility compliance. It evaluates the ``CKColor/apcaContrast(on:)`` value against standardized thresholds that account for font size and font weight.

### Purpose

This method is the recommended way to verify typographic accessibility in modern applications. By accounting for font size and weight, it ensures that your design is truly legible for all users, moving beyond the limitations of "one-size-fits-all" legacy contrast ratios.

### Details

- **Parameters:**
  - `background`: The background color.
  - `size`: The font size in points.
  - `weight`: The ``ColorKit/CKColor/FontWeight`` of the text.
- **Return Value:** `true` if the pairing meets the required contrast for the specified font characteristics.

### Example Usage

```swift
import ColorKit

let bg = CKColor.white
let txt = CKColor.gray

let isAccessible = txt.isAPCAAccessible(
    on: bg,
    size: 16,
    weight: .regular
)

if isAccessible {
    print("Accessible for body text")
}
```
