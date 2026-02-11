# ``ColorKit/CKColor/pink``

@Metadata {
    @TitleHeading("Standard Colors")
    @DisplayName("Pink", style: symbol)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "15.0")
    @Available(iPadOS, introduced: "15.0")
    @Available(macOS, introduced: "12.0")
    @Available(tvOS, introduced: "15.0")
    @Available(watchOS, introduced: "8.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticArticleSubheading(disabled)
}

A standard pink color that adapts to the system environment.

## Overview

`CKColor.pink` provides a platform-integrated pink color. On supported platforms (iOS 15.0+, macOS 12.0+), it resolves to the system pink variant; otherwise, it falls back to a standard red.

> Note: Dynamic appearance, high contrast, and accessibility adjustments are only active when a system variant is available for resolution on the current platform.

### Localization

The color name is translated into every native iOS language and is available through the ``CKColor/localizedDescription`` property.

### Details

- **Gamut:** sRGB
- **Fallback Value:** RGB(1.0, 0.0, 0.5)

### Example Usage

```swift
import SwiftUI
import ColorKit

struct PinkView: View {
    let color = CKColor.pink
    
    var body: some View {
        Circle()
            .fill(color)
        
        Text(color.localizedDescription)
            .foregroundStyle(color)
    }
}
```
