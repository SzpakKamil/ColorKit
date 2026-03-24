# ``SwiftUICore/Binding/asColor``

@Metadata {
    @TitleHeading("Binding Extensions")
    @DisplayName("asColor", style: symbol)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(tvOS, introduced: "14.0")
    @Available(watchOS, introduced: "7.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}


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
