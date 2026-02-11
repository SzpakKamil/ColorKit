# ``ColorKit/CKColor/RGBA``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("RGBA", style: symbol)
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

A structure representing Red, Green, Blue, and Alpha components.

## Overview

The `RGBA` struct is the primary data model used by ColorKit to store and manipulate color components. It supports both standard dynamic range values (0.0 to 1.0) and extended dynamic range (HDR) values via the `headroom` property.

## Topics

### Initializers
- ``init(from:)-(CKColor.RGBA)``
- ``init(r:g:b:a:headroom:)``

### Properties
- ``r``
- ``g``
- ``b``
- ``a``
- ``headroom``

### Conversions
- ``rgbRepresentation()``
