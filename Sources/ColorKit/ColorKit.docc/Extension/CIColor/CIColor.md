# ``CoreImage/CIColor``

@Metadata {
    @TitleHeading("Core Image Extensions")
    @DisplayName("CIColor", style: symbol)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "13.0")
    @Available(iPadOS, introduced: "13.0")
    @Available(macOS, introduced: "10.15")
    @Available(tvOS, introduced: "13.0")
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

Extensions to the Core Image color type.

## Overview

`CIColor` objects are used primarily within Core Image pipelines, representing high-precision color values often in linear color spaces.

The bridge between `CIColor` and ColorKit enables a seamless transition from hardware-accelerated image processing to perceptual UI design. It allows colors extracted from image filters or processed textures to be easily analyzed for accessibility or integrated into dynamic SwiftUI themes.

## Topics

### Bridging
- ``ckColor``
