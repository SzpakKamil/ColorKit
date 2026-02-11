# ``ColorKit/CKColor/HSL``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("HSL", style: symbol)
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

A structure representing Hue, Saturation, and Lightness components.

## Overview

The `HSL` struct provides a coordinate system that is often more intuitive for designers than raw RGB. It describes colors in terms of their base pigment (Hue), their intensity (Saturation), and their brightness (Lightness).

## Topics

### Initializers
- ``init(from:)-(CKColor.RGBA)``
- ``init(h:s:l:a:headroom:)``

### Properties
- ``h``
- ``s``
- ``l``
- ``a``
- ``headroom``

### Conversions
- ``rgbRepresentation()``
