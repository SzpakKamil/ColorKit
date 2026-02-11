# ``ColorKit/CKColor/CMYK``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("CMYK", style: symbol)
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

A structure representing Cyan, Magenta, Yellow, and Key (Black) components.

## Overview

The `CMYK` struct represents the subtractive color model used in printing. While ColorKit is primarily a digital framework, it provides `CMYK` support for interoperability with print-oriented color definitions.

## Topics

### Initializers
- ``init(from:)-(CKColor.RGBA)``
- ``init(c:m:y:k:a:headroom:)``

### Properties
- ``c``
- ``m``
- ``y``
- ``k``
- ``a``
- ``headroom``

### Conversions
- ``rgbRepresentation()``
