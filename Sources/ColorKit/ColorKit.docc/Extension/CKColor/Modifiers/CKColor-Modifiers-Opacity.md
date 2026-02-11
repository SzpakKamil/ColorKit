# ``ColorKit/CKColor/opacity(_:)``

@Metadata {
    @TitleHeading("Modifiers")
    @DisplayName("Opacity", style: symbol)
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

Adjusts the transparency of the color.

## Overview

The `opacity(_:)` modifier returns a new `CKColor` with the specified opacity level applied to its existing alpha channel. This operation preserves the color's dynamic traits (dark mode, high contrast) and its original color space.

### Details

- **Parameters:**
  - `amount`: The multiplier for the existing alpha channel (0.0 to 1.0).
- **Return Value:** A new dynamic `CKColor` with adjusted transparency.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct OpacityView: View {
    let color = CKColor.red.opacity(0.5)
    
    var body: some View {
        Circle()
            .fill(color)
        
        Text(color.localizedDescription)
            .foregroundStyle(color)
    }
}
```
