# ``SwiftUICore/Color/ckColor``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("CKColor Bridge", style: symbol)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(tvOS, introduced: "14.0")
    @Available(watchOS, introduced: "7.0")
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

Converts a SwiftUI `Color` to a dynamic `CKColor`.

## Overview

The `ckColor` property allows for seamless interoperability between SwiftUI's standard `Color` type and ColorKit's advanced color science tools.

### Purpose

This property acts as a high-level shortcut for the ``ColorKit/CKColor/init(_:)`` initializer. It enables you to quickly access ColorKit features like APCA contrast checks or perceptual blending directly from colors defined in your SwiftUI views.

### Example Usage

```swift
import SwiftUI
import ColorKit

struct ContentView: View {
    let color = Color.accentColor
    
    var body: some View {
        let ck = color.ckColor // Easy conversion to CKColor
        Text("Luminance: \(ck.luminance)")
    }
}
```
