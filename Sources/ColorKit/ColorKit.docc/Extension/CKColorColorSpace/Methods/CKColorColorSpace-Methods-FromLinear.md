# ``ColorKit/CKColor/ColorSpace/fromLinear(_:)``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("From Linear", style: symbol)
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

Applies the forward transfer function to encode a linear intensity value.

## Overview

The `fromLinear(_:)` method converts linear light intensity back into a gamma-encoded or non-linear component value. This is typically the final step after performing color math, preparing the color for display or storage.

The method applies the specific forward transfer function (OETF - Opto-Electronic Transfer Function) for the current color space:
- **sRGB / Display P3 / Extended sRGB:** Applies the IEC 61966-2-1 piecewise formula.
- **Adobe RGB:** Applies the inverse gamma 2.2 transformation.
- **ROMM RGB:** Applies the ISO 22028-2 forward formula.
- **Linear Spaces:** Returns the value unchanged.

### Parameters

- `v`: The linear light intensity value.

### Return Value

The gamma-encoded component value.

### Example Usage

```swift
import ColorKit

let space = CKColor.ColorSpace.sRGB
let encodedRed = space.fromLinear(0.214) 
// Converts linear light back to sRGB encoded value (~0.5)
```
