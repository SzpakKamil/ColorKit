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

Applies to the text color's linear luminance. Defaults to `1.14`.

### Purpose

`txtExpt` weights the foreground (text) luminance. It works with `bgExpt` to establish contrast calculation "polarity", distinguishing light-on-dark from dark-on-light.

### Example Usage

```swift
import ColorKit

var constants = CKAPCA.Constants()
constants.txtExpt = 1.10
```
