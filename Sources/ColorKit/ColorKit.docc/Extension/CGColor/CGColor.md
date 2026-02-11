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

Core Graphics `CGColor` is a low-level color representation used across Apple's frameworks for drawing, layers, and coordinate-space specific color definitions.

Bridging `CGColor` to ColorKit is essential for developers working with custom drawing code or `CALayer` hierarchies. By converting a low-level `CGColor` into a dynamic ``ColorKit/CKColor``, you gain access to high-level perceptual modifications, accessibility checks, and cross-gamut conversions while preserving the technical precision of the original color data.

## Topics

### Bridging
- ``ckColor``
