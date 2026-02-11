# ``ColorKit/CKBlendMode``

@Metadata {
    @TitleHeading("Blending")
    @DisplayName("Blend Mode", style: symbol)
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

An enumeration of supported color blending modes.

## Overview

`CKBlendMode` defines the mathematical formulas used to combine two colors (a base color and a blend color). These modes are used by the ``ColorKit/CKColor/blended(with:mode:opacity:)`` modifier to perform dynamic color compositing that respects system appearances and color spaces.

## Topics

### Enum Cases
- ``normal``
- ``multiply``
- ``screen``
- ``overlay``
- ``darken``
- ``lighten``
- ``colorDodge``
- ``colorBurn``
- ``softLight``
- ``hardLight``
- ``difference``
- ``exclusion``
