# ``SwiftUICore/Color``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("Color", style: symbol)
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

Extensions to the SwiftUI color type.

## Overview

SwiftUI's `Color` type is the primary way to define and display color in modern Apple app development. While highly capable for standard UI tasks, it lacks built-in support for advanced color science.

Bridging `Color` to ColorKit allows you to take any color used in your SwiftUI views and immediately perform high-precision operations such as APCA contrast checking, perceptual blending, or gamut conversion. This integration makes it easy to add advanced accessibility and design system features to any SwiftUI project.

## Topics

### Bridging
- ``ckColor``

### Properties
- ``hexString``

### Initializers
- ``init(hue:saturation:lightness:opacity:headroom:colorSpace:)``
- ``init(cyan:magenta:yellow:key:opacity:headroom:colorSpace:)``
- ``init(L:a:b:opacity:headroom:colorSpace:)``
- ``init(okL:okA:okB:opacity:headroom:colorSpace:)``
- ``init(L:C:h:opacity:headroom:colorSpace:)``

### Modifiers
- ``blended(with:mode:opacity:)``

### Component Retrieval
- ``components(as:)``
- ``rgbComponents()``
- ``hslComponents()``
- ``cmykComponents()``
- ``labComponents()``
- ``okLabComponents()``
- ``lchComponents()``
