# ``ColorKit/CKColor/OKLAB``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("OKLAB", style: symbol)
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

A structure representing OKLAB perceptual color components.

## Overview

The `OKLAB` struct implements a modern perceptual color space. It is optimized for tasks like image processing, gradients, and UI design, providing better perceptual uniformity than legacy models.

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
**Reference:** Björn Ottosson, "A perceptual color space for image processing" (2020).
