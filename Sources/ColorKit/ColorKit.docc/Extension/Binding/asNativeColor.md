# ``SwiftUICore/Binding/asNativeColor``

@Metadata {
    @TitleHeading("Binding Extensions")
    @DisplayName("asNativeColor", style: symbol)
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
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

Projections for `Binding<CKColor>` to `Binding<NativeColor>`.

## Overview

The `asNativeColor` property provides a read-write bridge between a `CKColor` binding and a platform-native color binding (`UIColor` or `NSColor`). This is essential when bridging between SwiftUI and UIKit/AppKit components that require color bindings.

### Details

- **Type:** `Binding<NativeColor>`
- **Behavior:**
    - **Get:** Returns the `nativeColor` property of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` with the new platform-native color.
