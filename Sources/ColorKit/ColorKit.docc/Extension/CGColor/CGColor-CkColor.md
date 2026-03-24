Converts a Core Graphics color to a `CKColor`.

## Overview

Use `ckColor` to convert `CGColor` objects into the ColorKit format.

### Purpose

Bridge `CGColor` from layers (`CALayer`) or drawing contexts to ColorKit. This property handles conversion from the source `CGColorSpace` to ColorKit's representation.

### Example Usage

```swift
import CoreGraphics
import ColorKit

let cgColor = CGColor(gray: 0.5, alpha: 1.0)
let ckColor = cgColor.ckColor
```
