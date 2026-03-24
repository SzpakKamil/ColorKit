# ``ColorKit/CKAPCA/Constants``

@Metadata {
    @TitleHeading("APCA")
    @DisplayName("Constants", style: symbol)
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

Mathematical coefficients for the APCA algorithm.

## Overview

`Constants` holds the exponent and scaling values for the APCA perceptual contrast formula.

### Purpose

Tune the APCA algorithm's mathematical curve. Default values align with international standards, but you can adjust them for specialized hardware or experimental research.

### Properties

- `sExpt`: Main scaling exponent.
- `bgExpt`: Background luminance exponent.
- `txtExpt`: Text luminance exponent.
- `blkThrs`: Black/near-black level threshold.
- `scale`: Overall scaling factor.

### Example Usage

```swift
import ColorKit

// Create a custom set of constants
var customConstants = CKAPCA.Constants()
customConstants.scale = 1.2 // Increase overall sensitivity
```
