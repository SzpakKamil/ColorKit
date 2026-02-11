# ``ColorKit/CKColor/customMirror``

@Metadata {
    @TitleHeading("Description Properties")
    @DisplayName("Custom Mirror", style: symbol)
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

A mirror that reflects the color's internal state.

## Overview

The `customMirror` property allows the Swift debugger and playground inspectors to display a clear view of the color's internal properties, such as its identifier, color space, and luminance.

### Details

- **Protocol:** `CustomReflectable`
- **Reflected Properties:**
  - `id`: The unique 128-bit identifier.
  - `colorSpace`: The current color space of the color.
  - `luminance`: The calculated perceptual luminance.
  - `isLight`: A boolean indicating if the color is considered light.

### Example Usage

```swift
import ColorKit

let color = CKColor.blue
let mirror = Mirror(reflecting: color)

for child in mirror.children {
    print("\(child.label ?? "unknown"): \(child.value)")
}
```
