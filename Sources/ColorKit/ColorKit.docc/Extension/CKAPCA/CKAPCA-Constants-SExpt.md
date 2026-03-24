# ``ColorKit/CKAPCA/Constants/sExpt``

@Metadata {
    @TitleHeading("APCA Constants")
    @DisplayName("Scaling Exponent", style: symbol)
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

The main scaling exponent for the APCA formula.

## Overview

Adjusts the overall contrast curve. Defaults to `0.56` (APCA-W3 Silver draft).

### Purpose

`sExpt` controls the contrast calculation power curve. It maps the raw luminance difference to match human perceptual nonlinearities.

### Example Usage

```swift
import ColorKit

// Adjust the scaling curve for a custom engine
var constants = CKAPCA.Constants()
constants.sExpt = 0.60
```
