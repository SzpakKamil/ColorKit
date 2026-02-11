# ``ColorKit/CKColor/init(cyan:magenta:yellow:key:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init CMYK", style: symbol)
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

Creates a `CKColor` from CMYK components.

## Overview

This initializer allows for the creation of colors using the subtractive CMYK (Cyan, Magenta, Yellow, and Key/Black) color model. While CMYK is traditionally used for print, this initializer provides a convenient way to bring print-oriented color definitions into a digital environment.

ColorKit internally converts the CMYK components into its high-precision working format, ensuring that the color remains consistent when used in SwiftUI views or during complex color operations. It also maintains support for alpha transparency and HDR headroom.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Initialize from standard CMYK print values
let ckColor = CKColor(cyan: 1.0, magenta: 0.0, yellow: 0.0, key: 0.0) // Pure Cyan
```

#### Full Initialization
```swift
import ColorKit

// Initialize CMYK with explicit opacity and color space
let ckColor = CKColor(
    cyan: 0.0,
    magenta: 1.0,
    yellow: 1.0,
    key: 0.0,
    opacity: 1.0,
    headroom: nil,
    colorSpace: .cmyk
)
```
