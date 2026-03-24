# ``CoreGraphics/CGColor``

@Metadata {
    @TitleHeading("Core Graphics Extensions")
    @DisplayName("CGColor", style: symbol)
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

Extensions to the Core Graphics color type.

## Overview

Core Graphics `CGColor` represents low-level colors for drawing and layers.

Bridge `CGColor` to ColorKit to integrate custom drawing or `CALayer` hierarchies. Converting `CGColor` to ``ColorKit/CKColor`` enables high-level perceptual modifications, accessibility checks, and cross-gamut conversions while preserving precision.

## Topics

### Bridging
- ``ckColor``
