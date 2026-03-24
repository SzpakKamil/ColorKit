# ``ColorKit/CKColor/standardColors``

@Metadata {
    @TitleHeading("Standard Colors")
    @DisplayName("Standard Colors", style: symbol)
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

A collection of all predefined standard colors.

## Overview

`CKColor.standardColors` is an array containing all the standard colors provided by ColorKit, including red, orange, yellow, green, mint, teal, cyan, blue, indigo, purple, pink, brown, gray, white, and black.

### Localization

Each color name within the collection is translated into every native iOS language and Access via ``CKColor/localizedDescription`` property.

### Details

- **Gamut:** sRGB
- **Type:** Collection of predefined adaptive colors.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct PaletteView: View {
    var body: some View {
        HStack {
            ForEach(CKColor.standardColors) { color in
                VStack {
                    Circle()
                        .fill(color)
                    Text(color.localizedDescription)
                        .foregroundStyle(color)
                }
            }
        }
    }
}
```
