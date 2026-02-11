# ``ColorKit/CKColor/init(L:a:b:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init LAB", style: symbol)
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

Creates a `CKColor` from CIE LAB components.

## Overview

This initializer uses the CIE L*a*b* (LAB) color space, which is designed to be perceptually uniform. This means that a change of a certain amount in a color value should produce a change of about the same visual importance.

By initializing colors in LAB space, you can perform advanced color science operations with predictable visual results. ColorKit accurately maps the Lightness (L) and the color-opponent dimensions (a and b) into its internal format, providing a robust foundation for applications that require high perceptual accuracy.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Create a color based on perceptual LAB coordinates
let ckColor = CKColor(L: 53.23, a: 80.11, b: 67.22) // Approximately Red
```

#### Full Initialization
```swift
import ColorKit

// Initialize LAB with explicit variants and color space control
let ckColor = CKColor(
    L: 100.0,
    a: 0.0,
    b: 0.0,
    opacity: 1.0,
    headroom: nil,
    colorSpace: .lab
)
```
