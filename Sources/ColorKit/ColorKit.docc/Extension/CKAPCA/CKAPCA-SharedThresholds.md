Global lookup table for accessibility checks.

## Overview

Modify this shared instance to set custom accessibility requirements. Affects ``CKColor/isAPCAAccessible(on:size:weight:)`` project-wide.

### Purpose

Define the strictness of application accessibility standards. `sharedThresholds` ensures consistency across the UI, whether following WCAG 3.0 Silver levels or implementing a custom design system.

### Example Usage

```swift
import ColorKit

// Implement extremely strict custom thresholds
CKAPCA.sharedThresholds = CKAPCA.Thresholds { size, weight in
    return 95.0 // Require near-maximum contrast for everything
}
```
