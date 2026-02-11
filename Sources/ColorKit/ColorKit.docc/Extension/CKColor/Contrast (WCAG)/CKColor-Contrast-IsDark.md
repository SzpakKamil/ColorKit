# ``ColorKit/CKColor/isDark``

@Metadata {
    @TitleHeading("Contrast (WCAG)")
    @DisplayName("Is Dark", style: symbol)
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

A boolean indicating if the color is perceptually dark.

## Overview

The `isDark` property is the inverse of ``CKColor/isLight``. It allows you to quickly check if a color's perceptual brightness is low.

### Purpose

Use `isDark` to determine when a background color requires light-colored components to maintain visibility. It is particularly useful for adapting custom controls or complex views that don't automatically inherit system accessibility behaviors.

### Details

- **Threshold:** Returns `true` if ``CKColor/luminance`` is less than or equal to `0.5`.
- **Logic:** Based on modern OKLAB perceptual lightness.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct DarkModeView: View {
    let accentColor = CKColor.mint
    
    var body: some View {
        VStack {
            if accentColor.isDark {
                Image(systemName: "moon.fill")
            } else {
                Image(systemName: "sun.max.fill")
            }
        }
        .background(accentColor)
    }
}
```
