# ``ColorKit/CKAPCA/Constants/scale``

@Metadata {
    @TitleHeading("APCA Constants")
    @DisplayName("Scale Factor", style: symbol)
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

The overall scaling factor for Lc values.

## Overview

Scales the raw result to the standardized Lightness Contrast (`Lc`) range. Defaults to `1.14`.

### Purpose

`scale` normalizes the contrast value. It fits the resulting `Lc` numbers within the standard -108 to +106 range for compliance checking and design tools.

### Example Usage

```swift
import ColorKit

var constants = CKAPCA.Constants()
constants.scale = 1.15 // Slightly increase contrast reporting sensitivity
```
