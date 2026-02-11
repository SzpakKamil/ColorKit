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

This exponent is applied to the background color's linear luminance. The default value is `1.61`.

### Purpose

`bgExpt` accounts for the "flare" effect (admittance) of the background. It ensures that the algorithm correctly predicts contrast loss when text is placed on extremely bright backgrounds compared to darker ones.

### Example Usage

```swift
import ColorKit

var constants = CKAPCA.Constants()
constants.bgExpt = 1.65 // Fine-tune background flare sensitivity
```
