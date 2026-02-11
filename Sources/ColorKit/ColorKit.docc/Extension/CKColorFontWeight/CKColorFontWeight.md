# ``ColorKit/CKColor/FontWeight``

@Metadata {
    @TitleHeading("Contrast (WCAG)")
    @DisplayName("Font Weight", style: symbol)
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

Standard font weights mapped to numeric values for APCA lookup.

## Overview

The `FontWeight` enum provides a standardized set of weights that align with both CSS numeric scales and Apple's system font weights. These values are a cornerstone of modern accessibility calculations within ColorKit.

### Role in APCA Calculations

Unlike legacy WCAG 2.1 which uses a fixed ratio regardless of text size, the **Advanced Perceptual Contrast Algorithm (APCA)** is spatial-frequency dependent. This means that as text becomes thinner or smaller, the human eye requires more contrast to maintain the same level of legibility.

ColorKit uses the `FontWeight` in conjunction with font size to perform a lookup in the ``CKAPCA/Thresholds`` table. This lookup determines the minimum required Lightness Contrast (`Lc`) value for a specific typographical configuration.

| Weight Category | Impact on Contrast |
| :--- | :--- |
| **Thin / Light** | High spatial frequency. Requires very high `Lc` values (often 90+) for small sizes. |
| **Regular / Medium** | Standard spatial frequency. Balanced requirements for body text. |
| **Bold / Black** | Low spatial frequency. Remains legible at lower `Lc` values (as low as 60 for large titles). |

## Topics

### Enum Cases
- ``black``
- ``bold``
- ``extraBold``
- ``extraLight``
- ``light``
- ``medium``
- ``regular``
- ``semibold``
- ``thin``
