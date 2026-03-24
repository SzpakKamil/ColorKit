Projects `Binding<CKColor>` to `Binding<Color>`.

## Overview

Use `asColor` to bridge a `CKColor` binding to a SwiftUI `Color` binding. Integrate with SwiftUI components like `ColorPicker` while retaining `CKColor` features.

### Details

- **Type:** `Binding<Color>`
- **Behavior:**
    - **Get:** Returns the SwiftUI `Color` representation of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` with the new SwiftUI `Color`.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct ColorEditor: View {
    @Binding var ckColor: CKColor
    
    var body: some View {
        ColorPicker("Choose Color", selection: $ckColor.asColor)
    }
}
```
