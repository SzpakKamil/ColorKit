# ``ColorKit/CKColor/cmykComponents()``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("CMYK Components", style: symbol)
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

Returns the CMYK components of the color.

## Overview

The `cmykComponents()` function is a convenience method that converts the color's primary components to the CMYK (Cyan, Magenta, Yellow, Key/Black) model.

### Details

- **Return Value:** A ``CKColor/CMYK`` struct.
