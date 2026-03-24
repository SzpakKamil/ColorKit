Projects `Binding<CKColor>` to `Binding<NativeColor>`.

## Overview

Use `asNativeColor` to bridge a `CKColor` binding to a platform-native color binding (`UIColor` or `NSColor`). Connect SwiftUI state to UIKit or AppKit components requiring color bindings.

### Details

- **Type:** `Binding<NativeColor>`
- **Behavior:**
    - **Get:** Returns the `nativeColor` property of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` with the new platform-native color.
