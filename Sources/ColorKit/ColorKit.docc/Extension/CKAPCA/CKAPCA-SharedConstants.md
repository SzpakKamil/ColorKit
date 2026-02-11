# ``ColorKit/CKAPCA/sharedConstants``

@Metadata {
    @TitleHeading("APCA")
    @DisplayName("Shared Constants", style: symbol)
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

The global mathematical constants used for contrast calculation.

## Overview

Modify this shared instance to update the math engine parameters globally for the entire application.

### Purpose

The `sharedConstants` property provides a centralized point of configuration. By updating this value, you ensure that every part of your app—from automated UI checks to dynamic color generators—uses the exact same mathematical basis for its contrast logic.

### Example Usage

```swift
import ColorKit

// Update the global APCA coefficients at app launch
CKAPCA.sharedConstants.sExpt = 0.6
```
