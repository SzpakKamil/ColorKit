# ``ColorKit/CKColor/init(L:C:h:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init LCH", style: symbol)
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

Creates a `CKColor` from CIE LCH components.

## Overview

This initializer uses the LCH color space, which is a cylindrical representation of the CIE LAB model. It uses Lightness (L), Chroma (C), and Hue (h) as its primary axes.

LCH is widely considered one of the most intuitive color spaces for humans to use, as it separates color into brightness, intensity, and hue angle (in degrees). This initializer makes it easy to programmatically generate color palettes or adjust the vividness of a color while keeping its perceptual brightness and hue constant.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Create a color using intuitive LCH coordinates
let ckColor = CKColor(L: 53.23, C: 104.55, h: 40.85) // Approximately Red
```

#### Full Initialization
```swift
import ColorKit

// Initialize LCH with full control over opacity and HDR properties
let ckColor = CKColor(
    L: 100.0,
    C: 0.0,
    h: 0.0,
    opacity: 1.0,
    headroom: nil,
    colorSpace: .lch
)
```
