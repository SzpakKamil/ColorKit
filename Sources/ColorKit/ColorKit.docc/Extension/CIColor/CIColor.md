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

`CIColor` represents high-precision color values in Core Image pipelines.

Bridge `CIColor` to ColorKit to transition from hardware-accelerated image processing to perceptual UI design. Analyze colors extracted from filters or textures for accessibility, or integrate them into dynamic SwiftUI themes.

## Topics

### Bridging
- ``ckColor``
