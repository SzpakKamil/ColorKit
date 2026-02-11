# ``SwiftUICore/Color/cmykComponents()``

@Metadata {
    @TitleHeading("Color Extensions")
    @DisplayName("CMYK Components", style: symbol)
    @SupportedLanguage(swift)
    @Available(iOS, introduced: "14.0")
    @Available(iPadOS, introduced: "14.0")
    @Available(macOS, introduced: "11.0")
    @Available(tvOS, introduced: "14.0")
    @Available(watchOS, introduced: "7.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @DocumentationExtension(mergeBehavior: override)
}

Returns the CMYK components of the SwiftUI color.

## Overview

A convenience method that converts the SwiftUI `Color` to the subtractive Cyan, Magenta, Yellow, and Key (Black) model.

### Return Value

A ``ColorKit/CKColor/CMYK`` struct.
