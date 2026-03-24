The main scaling exponent for the APCA formula.

## Overview

Adjusts the overall contrast curve. Defaults to `0.56` (APCA-W3 Silver draft).

### Purpose

`sExpt` controls the contrast calculation power curve. It maps the raw luminance difference to match human perceptual nonlinearities.

### Example Usage

```swift
import ColorKit

// Adjust the scaling curve for a custom engine
var constants = CKAPCA.Constants()
constants.sExpt = 0.60
```
