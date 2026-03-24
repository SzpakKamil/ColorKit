The scaling factor for Lc values.

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
