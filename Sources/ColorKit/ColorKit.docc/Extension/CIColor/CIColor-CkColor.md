Converts a Core Image color to a `CKColor`.

## Overview

Use `ckColor` to bridge `CIColor` to ColorKit for Core Image workflows.

### Purpose

Analyze or modify colors from filters or pipelines using ColorKit's perceptual models. This bridge connects high-precision image processing to UI-focused color manipulation.

> Note: Unavailable on watchOS.

### Example Usage

```swift
import CoreImage
import ColorKit

let ciColor = CIColor(red: 0.5, green: 1.0, blue: 0.0)
let ckColor = ciColor.ckColor
```
