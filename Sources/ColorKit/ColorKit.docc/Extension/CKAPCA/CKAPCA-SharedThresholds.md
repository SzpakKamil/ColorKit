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

The global lookup table used for accessibility checks.

## Overview

Modify this shared instance to provide custom accessibility requirements. This affects the results of ``CKColor/isAPCAAccessible(on:size:weight:)`` across your project.

### Purpose

`sharedThresholds` allows you to define the strictness of your application's accessibility standards. Whether you need to strictly follow WCAG 3.0 Silver levels or implement a custom design system with higher contrast requirements, this property ensures consistency across your entire UI.

### Example Usage

```swift
import ColorKit

// Implement extremely strict custom thresholds
CKAPCA.sharedThresholds = CKAPCA.Thresholds { size, weight in
    return 95.0 // Require near-maximum contrast for everything
}
```
