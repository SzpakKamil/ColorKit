<<<<<<< HEAD
# ``ColorKit/CKAPCA/sharedThresholds``

@Metadata {
    @TitleHeading("APCA")
    @DisplayName("Shared Thresholds", style: symbol)
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

=======
>>>>>>> 1.0
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
