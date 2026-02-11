# ``ColorKit/CKAPCA/Constants/txtExpt``

@Metadata {
    @TitleHeading("APCA Constants")
    @DisplayName("Text Exponent", style: symbol)
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

The exponent for text luminance.

## Overview

This exponent is applied to the text color's linear luminance. The default value is `1.14`.

### Purpose

The `txtExpt` constant defines how the luminance of the foreground (text) is weighted. It works in tandem with `bgExpt` to establish the "polarity" of the contrast calculation, distinguishing between light-on-dark and dark-on-light.

### Example Usage

```swift
import ColorKit

var constants = CKAPCA.Constants()
constants.txtExpt = 1.10
```
