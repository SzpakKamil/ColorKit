# ``ColorKit/CKColor/indigo``

@Metadata {
    @TitleHeading("Standard Colors")
    @DisplayName("Indigo", style: symbol)
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

Standard indigo color. Adapts to system.

## Overview

`CKColor.indigo` provides a platform-integrated indigo color. On supported platforms (iOS 15.0+, macOS 12.0+), it resolves to the system indigo variant; otherwise, it falls back to a standard blue.

> Note: Dynamic appearance, high contrast, and accessibility adjustments active only when a system variant is available for resolution on the current platform.

### Localization

The color name is translated into every native iOS language and Access via ``CKColor/localizedDescription`` property.

### Details

- **Gamut:** sRGB
- **Fallback Value:** RGB(0.3, 0.0, 0.5)

### Example Usage

```swift
import SwiftUI
import ColorKit

struct IndigoView: View {
    let color = CKColor.indigo
    
    var body: some View {
        Circle()
            .fill(color)
        
        Text(color.localizedDescription)
            .foregroundStyle(color)
    }
}
```
