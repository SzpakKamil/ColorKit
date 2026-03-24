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
