# ``ColorKit/CKColor/init(hexInt:hexIntDark:hexIntHighContrast:hexIntHighContrastDark:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init Hex Int", style: symbol)
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

Creates a dynamic `CKColor` from integer hex values.

## Overview

This initializer is a convenient way to define colors using standard hexadecimal integer notation (e.g., `0xFF0000`). It is highly useful for implementing design systems where color values are provided as hex codes.

Beyond simple static colors, this initializer supports the definition of a full dynamic range in a single call. You can provide optional hex integers for dark mode and high-contrast variants. ColorKit handles the conversion of these integers into normalized components and packages them into a single, adaptive `CKColor`. By default, colors are assumed to be in the sRGB color space, but this can be customized to support wide-gamut designs.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Create a static color from a hex integer
let ckColor = CKColor(hexInt: 0xFF0000) // Pure Red
```

#### Full Initialization
```swift
import ColorKit

// Create a dynamic color with custom dark and high-contrast variants via hex
let ckColor = CKColor(
    hexInt: 0xFFFFFF,           // White (Light)
    hexIntDark: 0x000000,       // Black (Dark)
    hexIntHighContrast: 0xFFFF00, // Yellow (HC Light)
    hexIntHighContrastDark: 0x0000FF, // Blue (HC Dark)
    colorSpace: .displayP3
)
```
