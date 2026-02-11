# ``ColorKit/CKColor/LAB``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("LAB", style: symbol)
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

A structure representing CIE 1976 L*a*b* components.

## Overview

The `LAB` struct represents colors in a perceptually uniform space. It consists of a Lightness axis (L) and two color-opponent dimensions (a and b).

## Topics

### Initializers
- ``init(from:)-(CKColor.RGBA)``
- ``init(L:a:b:alpha:headroom:)``

### Properties
- ``L``
- ``a``
- ``b``
- ``alpha``
- ``headroom``

### Conversions
- ``rgbRepresentation()``

## Credits
**Reference:** ISO 11664-4:2008 (CIE S 014-4/E:2007).
