# ``ColorKit/CKColor/converted(to:iterations:)``

@Metadata {
    @TitleHeading("Modifiers")
    @DisplayName("Converted", style: symbol)
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

Converts the color to a specific target color space using Perceptual Gamut Mapping.

## Overview

The `converted(to:iterations:)` modifier transforms the color into a different color space while preserving its perceptual appearance. Instead of simple clipping, it uses an iterative OKLAB-based approach to maintain lightness and hue while reducing chroma to fit the target gamut.

### Details

- **Parameters:**
  - `targetSpace`: The destination color space (e.g., `.displayP3`, `.sRGB`).
  - `iterations`: The precision of the perceptual mapping algorithm (default is 6).
- **Return Value:** A new dynamic `CKColor` in the target color space.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct ConversionView: View {
    // Convert an sRGB color to Display P3
    let p3Color = CKColor.red.converted(to: .displayP3)
    
    var body: some View {
        Circle()
            .fill(p3Color)
        
        Text(p3Color.localizedDescription)
            .foregroundStyle(p3Color)
    }
}
```
