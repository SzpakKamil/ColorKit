# ``ColorKit/CKAPCA/Constants/bgExpt``

@Metadata {
    @TitleHeading("APCA Constants")
    @DisplayName("Background Exponent", style: symbol)
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

The exponent for background luminance.

## Overview

Applies to the background color's linear luminance. Defaults to `1.61`.

### Purpose

`bgExpt` accounts for background "flare" (admittance). It predicts contrast loss when placing text on extremely bright backgrounds versus darker ones.

### Example Usage

```swift
import ColorKit

var constants = CKAPCA.Constants()
constants.bgExpt = 1.65 // Fine-tune background flare sensitivity
```
