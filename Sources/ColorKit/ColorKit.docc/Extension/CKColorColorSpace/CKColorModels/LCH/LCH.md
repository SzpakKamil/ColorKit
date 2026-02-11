# ``ColorKit/CKColor/LCH``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("LCH", style: symbol)
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

A structure representing CIE L*C*h° components.

## Overview

The `LCH` struct is a cylindrical representation of the LAB space, making it more intuitive for humans to manipulate hue and intensity independently of lightness.

## Topics

### Initializers
- ``init(from:)-(CKColor.RGBA)``
- ``init(L:C:h:alpha:headroom:)``

### Properties
- ``L``
- ``C``
- ``h``
- ``alpha``
- ``headroom``

### Conversions
- ``rgbRepresentation()``
