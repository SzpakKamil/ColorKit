# ``ColorKit/CKColor/wcagLuminance``

@Metadata {
    @TitleHeading("Contrast (WCAG)")
    @DisplayName("WCAG Luminance", style: symbol)
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

Returns the relative luminance as defined by WCAG 2.1 standards.

## Overview

The `wcagLuminance` property calculates the relative luminance of a color using the standard Rec. 709 formula. Unlike ``CKColor/linearLuminance``, this property clamps the result to the standard dynamic range (0.0 to 1.0).

### Purpose

The purpose of this property is to provide a standardized input for legacy accessibility audits and calculations. It ensures that ColorKit can be used to verify compliance with strict WCAG 2.1 Level AA and AAA requirements using the industry-standard formulas.

### Details

- **Range:** 0.0 (Pure Black) to 1.0 (Pure White).
- **Formula:** Based on the linearized RGB components and Rec. 709 coefficients.
- **Usage:** Primarily used as an input for calculating the standard ``CKColor/contrastRatio(with:)``.

### Example Usage

```swift
import ColorKit

let color = CKColor.red
let relativeLuminance = color.wcagLuminance
print("Standard Relative Luminance: \(relativeLuminance)")
```
