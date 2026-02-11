# ``AppKit/NSColor``

@Metadata {
    @TitleHeading("Native Extensions")
    @DisplayName("NativeColor", style: symbol)
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

Extensions to the platform-native color types.

## Overview

`NativeColor` is a platform-agnostic typealias that resolves to `UIColor` on iOS, tvOS, and watchOS, or `NSColor` on macOS. These types are the foundation of Apple's legacy and system-level color handling.

The ColorKit bridge for native colors is specifically designed to handle the complexity of system adaptive colors. It ensures that when a native color is brought into ColorKit, all of its environmental variants (light, dark, high contrast) are correctly preserved and mapped, providing a unified and powerful API for working with platform-native color data.

## Topics

### Bridging
- ``ckColor``
