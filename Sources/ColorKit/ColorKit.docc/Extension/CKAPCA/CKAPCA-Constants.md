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
