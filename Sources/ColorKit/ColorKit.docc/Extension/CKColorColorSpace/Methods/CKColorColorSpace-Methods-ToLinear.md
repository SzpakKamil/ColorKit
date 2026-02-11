# ``ColorKit/CKColor/ColorSpace/toLinear(_:)``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("To Linear", style: symbol)
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

Applies the inverse transfer function to linearize a component value.

## Overview

The `toLinear(_:)` method converts a gamma-encoded or non-linear component value into linear light intensity. This process is essential before performing mathematical operations like blending or converting between different color spaces.

The method applies the specific inverse transfer function (EOTF - Electro-Optical Transfer Function) required by the current color space:
- **sRGB / Display P3 / Extended sRGB:** Applies the IEC 61966-2-1 piecewise formula.
- **Adobe RGB:** Applies a gamma 2.2 transformation.
- **ROMM RGB:** Applies the ISO 22028-2 formula.
- **Linear Spaces:** Returns the value unchanged.

### Parameters

- `v`: The non-linear component value (typically 0.0 to 1.0).

### Return Value

The linearized intensity value.

### Example Usage

```swift
import ColorKit

let space = CKColor.ColorSpace.sRGB
let linearRed = space.toLinear(0.5) 
// Converts mid-gray encoded value to linear light intensity (~0.214)
```
