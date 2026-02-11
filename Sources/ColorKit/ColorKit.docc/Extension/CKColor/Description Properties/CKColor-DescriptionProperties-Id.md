# ``ColorKit/CKColor/id``

@Metadata {
    @TitleHeading("Description Properties")
    @DisplayName("ID", style: symbol)
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

A unique, stable identifier for the color configuration.

## Overview

The `id` property provides a 128-bit value-type identifier calculated via bit-packing. This approach eliminates string allocation overhead during diffing, hashing, and SwiftUI view updates, ensuring O(1) access performance.

### Details

- **Type:** `Identifier` (a 128-bit packed value).
- **Behavior:** The identifier is stable and changes only when the color's underlying configuration (including its dynamic variants or color space) changes.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct IdentityView: View {
    let color = CKColor.red
    
    var body: some View {
        VStack {
            Circle().fill(color)
            Text("Internal ID: \(color.id.description)")
                .font(.caption)
        }
    }
}
```
