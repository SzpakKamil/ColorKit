# ``SwiftUICore/Color/blended(with:mode:opacity:)``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Blended", style: symbol)
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

Blends the current SwiftUI color with another color using a specific blend mode.

## Overview

The `blended(with:mode:opacity:)` method provides advanced compositing capabilities directly on SwiftUI's `Color` type. It internally bridges the colors to ``ColorKit/CKColor``, performs the mathematical blending, and returns a new SwiftUI `Color`.

This operation is fully dynamic and respects the underlying color spaces and appearance variants of both the base and blend colors.

### Parameters

- `blendColor`: The SwiftUI color to blend on top of the base.
- `mode`: The ``ColorKit/CKBlendMode`` formula to apply.
- `opacity`: The opacity of the blend layer (from `0.0` to `1.0`). Defaults to `1.0`.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct BlendingView: View {
    var body: some View {
        Circle()
            .fill(Color.blue.blended(with: .red, mode: .overlay, opacity: 0.5))
    }
}
```
