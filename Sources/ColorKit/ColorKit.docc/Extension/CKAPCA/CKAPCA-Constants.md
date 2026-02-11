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

The `Constants` struct holds the exponent and scaling values used by the APCA formula to calculate perceptual contrast. 

### Purpose

The purpose of this struct is to provide a way to tune the APCA algorithm's mathematical curve. While the default values align with international standards, this structure allows for fine-tuning the engine for specialized display hardware or experimental accessibility research.

### Properties

- `sExpt`: The main scaling exponent.
- `bgExpt`: The exponent for background luminance.
- `txtExpt`: The exponent for text luminance.
- `blkThrs`: The threshold for black/near-black levels.
- `scale`: The overall scaling factor applied to the resulting contrast value.

### Example Usage

```swift
import ColorKit

// Create a custom set of constants
var customConstants = CKAPCA.Constants()
customConstants.scale = 1.2 // Increase overall sensitivity
```
