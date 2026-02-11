# ``ColorKit/CKColor/localizedDescription``

@Metadata {
    @TitleHeading("Description Properties")
    @DisplayName("Localized Description", style: symbol)
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

A user-facing, localized name for the color.

## Overview

The `localizedDescription` property provides a human-readable name for the color, translated into the user's current locale.

### Localization

Color names for standard colors are translated into every native iOS language. This makes it ideal for use in accessibility labels, voice-over descriptions, or any user-facing UI elements that require a textual representation of a color.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct LocalizedView: View {
    let color = CKColor.mint
    
    var body: some View {
        Text(color.localizedDescription) // e.g., "Mint" in English, "Mięta" in Polish
            .foregroundStyle(color)
    }
}
```
