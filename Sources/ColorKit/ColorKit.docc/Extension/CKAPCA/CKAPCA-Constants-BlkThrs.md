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
