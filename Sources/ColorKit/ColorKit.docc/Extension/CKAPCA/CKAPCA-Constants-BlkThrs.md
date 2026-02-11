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

A small constant used to prevent mathematical instability when dealing with near-black colors. The default value is `0.02`.

### Purpose

`blkThrs` acts as a "floor" for luminance values. It prevents the algorithm from producing erratic or infinite results when one of the colors is pure black or very close to it, ensuring smooth math at the bottom of the dynamic range.

### Example Usage

```swift
import ColorKit

var constants = CKAPCA.Constants()
constants.blkThrs = 0.03
```
