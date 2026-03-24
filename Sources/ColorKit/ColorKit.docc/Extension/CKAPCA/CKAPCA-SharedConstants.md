Global mathematical constants for contrast calculation.

## Overview

Modify this shared instance to update math engine parameters application-wide.

### Purpose

`sharedConstants` centralizes configuration. Updating this value ensures that every part of the app—from automated UI checks to dynamic color generators—uses the same mathematical basis for contrast logic.

### Example Usage

```swift
import ColorKit

// Update the global APCA coefficients at app launch
CKAPCA.sharedConstants.sExpt = 0.6
```
