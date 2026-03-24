# ``ColorKit/CKAPCA/Constants/blkThrs``

@Metadata {
    @TitleHeading("APCA Constants")
    @DisplayName("Black Threshold", style: symbol)
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

The threshold for black level compensation.

## Overview

Prevents mathematical instability with near-black colors. Defaults to `0.02`.

### Purpose

`blkThrs` sets a luminance "floor". It prevents erratic or infinite results when a color is pure black or near-black, ensuring mathematical stability at the bottom of the dynamic range.

### Example Usage

```swift
import ColorKit

var constants = CKAPCA.Constants()
constants.blkThrs = 0.03
```
