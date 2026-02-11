# ``ColorKit/CKColor/color``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("Color", style: symbol)
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

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticArticleSubheading(disabled)
}

A bridge to the SwiftUI `Color` type.

## Overview

The `color` property provides a seamless bridge between `CKColor` and SwiftUI's native `Color` view. It resolves the dynamic components of `CKColor` (light/dark/contrast) based on the current environment when it is rendered.

### Details

- **Type:** `Color` (SwiftUI)
- **Behavior:** Dynamically resolves to the appropriate appearance variant in the SwiftUI view hierarchy.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct BridgeView: View {
    let ckColor = CKColor.blue
    
    var body: some View {
        ckColor.color // Used directly as a View
            .frame(width: 100, height: 100)
    }
}
```
