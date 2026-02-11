# ``ColorKit/CKColor/brown``

@Metadata {
    @TitleHeading("Standard Colors")
    @DisplayName("Brown", style: symbol)
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

A standard brown color that adapts to the system environment.

## Overview

`CKColor.brown` provides a platform-integrated brown color. It automatically resolves to the appropriate system variant (such as `systemBrown` on iOS or macOS).

> Note: Dynamic appearance, high contrast, and accessibility adjustments are only active when a system variant is available for resolution on the current platform.

### Localization

The color name is translated into every native iOS language and is available through the ``CKColor/localizedDescription`` property.

### Details

- **Gamut:** sRGB
- **Fallback Value:** RGB(0.6, 0.4, 0.2)

### Example Usage

```swift
import SwiftUI
import ColorKit

struct BrownView: View {
    let color = CKColor.brown
    
    var body: some View {
        Circle()
            .fill(color)
        
        Text(color.localizedDescription)
            .foregroundStyle(color)
    }
}
```
