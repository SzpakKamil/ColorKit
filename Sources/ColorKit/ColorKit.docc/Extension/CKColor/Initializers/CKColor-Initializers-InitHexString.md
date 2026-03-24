# ``ColorKit/CKColor/init(hexString:hexStringDark:hexStringHighContrast:hexStringHighContrastDark:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init Hex String", style: symbol)
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

Creates a dynamic `CKColor` from hex strings.

## Overview

This initializer allows you to define adaptive colors using hexadecimal string representations. It is robust, supporting strings with or without the `#` prefix, as well as 6-character (RGB) or 8-character (RGBA) formats.

Like other dynamic initializers in ColorKit, it allows for the optional specification of distinct hex strings for dark and high-contrast appearances. This makes it an ideal tool for parsing color configurations from JSON, CSS, or other external design assets. If a provided string is invalid, the initializer will gracefully fall back to a default black color while maintaining the integrity of the application's runtime.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Initialize from a simple hex string
let ckColor = CKColor(hexString: "#FF0000")
```

#### Full Initialization
```swift
import ColorKit

// Initialize a complex dynamic color using various hex string formats
let ckColor = CKColor(
    hexString: "#FFFFFF",      // White
    hexStringDark: "000000",   // Black (prefix-less)
    hexStringHighContrast: "#EEEEEE",
    hexStringHighContrastDark: "#111111",
    colorSpace: .sRGB
)
```
