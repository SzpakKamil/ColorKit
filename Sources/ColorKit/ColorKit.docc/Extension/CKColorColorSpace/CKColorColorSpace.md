# ``ColorKit/CKColor/ColorSpace``

@Metadata {
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

An enumeration of supported color spaces and models.

## Overview

The `ColorSpace` enum defines the working color spaces and coordinate systems supported by ColorKit. It handles the critical math required for color consistency, including linearization, gamma encoding, and wide-gamut (P3) / HDR headroom resolution.

Every `CKColor` instance is associated with a specific `ColorSpace`, ensuring that all mathematical operations (like blending and contrast calculation) are performed with technical precision.

## Topics

### Standard RGB Spaces
- ``sRGB``
- ``sRGBLinear``
- ``displayP3``

### Extended & HDR Spaces
- ``extendedSRGB``
- ``extendedLinearSRGB``

### Wide Gamut Spaces
- ``adobeRGB``
- ``rommRGB``

### Perceptual Models
- ``okLab``
- ``lab``
- ``lch``

### Working Models
- ``hsl``
- ``cmyk``

### Transformation Methods
- ``toLinear(_:)``
- ``fromLinear(_:)``
- ``linearRepresentation(for:)``
