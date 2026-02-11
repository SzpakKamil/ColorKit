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

A coefficient used to adjust the overall contrast curve. The default value is `0.56`, as defined in the APCA-W3 Silver draft.

### Purpose

The `sExpt` property controls the power curve of the contrast calculation. It is critical for mapping the raw luminance difference into a value that matches human perceptual nonlinearities.

### Example Usage

```swift
import ColorKit

// Adjust the scaling curve for a custom engine
var constants = CKAPCA.Constants()
constants.sExpt = 0.60
```
