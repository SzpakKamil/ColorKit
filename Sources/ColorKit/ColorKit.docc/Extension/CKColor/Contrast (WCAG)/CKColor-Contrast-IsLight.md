# ``ColorKit/CKColor/isLight``

@Metadata {
    @TitleHeading("Contrast (WCAG)")
    @DisplayName("Is Light", style: symbol)
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

A boolean indicating if the color is perceptually light.

## Overview

The `isLight` property provides a simple way to determine the general brightness of a color. It is calculated based on the color's perceptual ``CKColor/luminance``.

### Purpose

The primary purpose of `isLight` is to facilitate automatic UI adjustments. It allows developers to programmatically switch between light and dark foreground elements (like text or icons) to ensure they remain visible against a dynamic background color.

### Details

- **Threshold:** Returns `true` if ``CKColor/luminance`` is greater than `0.5`.
- **Logic:** Uses OKLAB-based perceptual lightness for high accuracy.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct ReadabilityView: View {
    let backgroundColor = CKColor.blue
    
    var body: some View {
        ZStack {
            backgroundColor.color
            
            Text("Readable Text")
                .foregroundColor(backgroundColor.isLight ? .black : .white)
        }
    }
}
```
