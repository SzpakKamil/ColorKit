# ``ColorKit/CKColor/RGBA/rgbRepresentation()``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("RGB Representation", style: symbol)
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

Returns the RGB representation of the components.

## Overview

For the `RGBA` struct, this function performs a simple pass-through operation. Since the structure already stores standard Red, Green, Blue, and Alpha components, the method returns `self` without any mathematical transformation.
