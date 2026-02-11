# ``ColorKit/CKColor/blended(with:mode:opacity:)``

@Metadata {
    @TitleHeading("Modifiers")
    @DisplayName("Blended", style: symbol)
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

Blends two colors using a specific blend mode.

## Overview

The `blended(with:mode:opacity:)` modifier combines the current color with another using standard mathematical blending formulas (e.g., multiply, screen, overlay). This operation is fully dynamic, blending each trait variant (light, dark, high contrast) independently.

### Details

- **Parameters:**
  - `blendColor`: The color to blend on top.
  - `mode`: The blend mode to apply (see ``CKBlendMode``).
  - `opacity`: The opacity of the blend layer (0.0 to 1.0).
- **Return Value:** A new dynamic `CKColor` resulting from the blend.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct BlendingView: View {
    let base = CKColor.blue
    let overlay = CKColor.red
    
    var body: some View {
        let blended = base.blended(with: overlay, mode: .multiply, opacity: 0.8)
        
        Circle()
            .fill(blended)
        
        Text(blended.localizedDescription)
            .foregroundStyle(blended)
    }
}
```
