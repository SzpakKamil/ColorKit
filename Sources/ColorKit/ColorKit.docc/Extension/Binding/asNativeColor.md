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

Projects `Binding<CKColor>` to `Binding<NativeColor>`.

## Overview

Use `asNativeColor` to bridge a `CKColor` binding to a platform-native color binding (`UIColor` or `NSColor`). Connect SwiftUI state to UIKit or AppKit components requiring color bindings.

### Details

- **Type:** `Binding<NativeColor>`
- **Behavior:**
    - **Get:** Returns the `nativeColor` property of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` with the new platform-native color.
