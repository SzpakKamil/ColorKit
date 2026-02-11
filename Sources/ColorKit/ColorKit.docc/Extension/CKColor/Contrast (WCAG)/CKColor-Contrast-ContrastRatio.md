# ``ColorKit/CKColor/contrastRatio(with:)``

@Metadata {
    @TitleHeading("Contrast (WCAG)")
    @DisplayName("Contrast Ratio", style: symbol)
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

Calculates the legacy WCAG 2.1 contrast ratio between two colors.

## Overview

The `contrastRatio(with:)` function implements the standard formula defined by the Web Content Accessibility Guidelines (WCAG) 2.1. It compares the relative luminance of the current color with another provided color.

### Purpose

This method is used to determine if two colors provide enough visual separation to meet legal and professional accessibility standards. It is the most common metric used for "pass/fail" testing of text legibility in digital products.

### Details

- **Parameters:**
  - `other`: The color to compare against.
- **Return Value:** A value between 1.0 and 21.0 representing the contrast ratio.
- **Standards:** WCAG 2.1 Level AA/AAA.

### Example Usage

```swift
import ColorKit

let background = CKColor.white
let foreground = CKColor.blue

let ratio = foreground.contrastRatio(with: background)

if ratio >= 4.5 {
    print("Passes WCAG 2.1 Level AA for normal text")
} else {
    print("Fails accessibility standards")
}
```
