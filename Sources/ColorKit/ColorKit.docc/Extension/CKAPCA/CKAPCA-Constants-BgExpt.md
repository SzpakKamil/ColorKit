The exponent for background luminance.

## Overview

Applies to the background color's linear luminance. Defaults to `1.61`.

### Purpose

`bgExpt` accounts for background "flare" (admittance). It predicts contrast loss when placing text on extremely bright backgrounds versus darker ones.

### Example Usage

```swift
import ColorKit

var constants = CKAPCA.Constants()
constants.bgExpt = 1.65 // Fine-tune background flare sensitivity
```
