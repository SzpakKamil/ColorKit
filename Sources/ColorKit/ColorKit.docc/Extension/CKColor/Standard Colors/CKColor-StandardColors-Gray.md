# ``ColorKit/CKColor/gray``

@Metadata {
    @TitleHeading("Standard Colors")
    @DisplayName("Gray", style: symbol)
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

Standard gray color. Adapts to system.

## Overview

`CKColor.gray` provides a platform-integrated gray color. Resolves to the appropriate system variant (such as `systemGray` on iOS or macOS).

> Note: Dynamic appearance, high contrast, and accessibility adjustments active only when a system variant is available for resolution on the current platform.

### Localization

The color name is translated into every native iOS language and Access via ``CKColor/localizedDescription`` property.

### Details

- **Gamut:** sRGB
- **Fallback Value:** RGB(0.5, 0.5, 0.5)

### Example Usage

```swift
import SwiftUI
import ColorKit

struct GrayView: View {
    let color = CKColor.gray
    
    var body: some View {
        Circle()
            .fill(color)
        
        Text(color.localizedDescription)
            .foregroundStyle(color)
    }
}
```
