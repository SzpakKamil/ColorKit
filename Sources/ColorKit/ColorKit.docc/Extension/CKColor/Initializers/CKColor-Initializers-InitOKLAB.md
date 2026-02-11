# ``ColorKit/CKColor/init(okL:okA:okB:opacity:headroom:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init OKLAB", style: symbol)
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

Creates a `CKColor` from OKLAB components.

## Overview

The OKLAB color space is a modern perceptual color space optimized for image processing and UI design. This initializer allows you to define colors using OKLAB's Lightness (L), a (green-red), and b (blue-yellow) components.

OKLAB is superior to legacy color spaces like CIE LAB for many digital tasks because it avoids many of the common artifacts (such as the "blue turn purple" shift) found in other models. Using this initializer ensures that your color definitions are grounded in modern color science, providing excellent results for gradients, blending, and high-dynamic-range content.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Create a color using the modern OKLAB perceptual model
let ckColor = CKColor(okL: 0.62, okA: 0.22, okB: 0.12)
```

#### Full Initialization
```swift
import ColorKit

// Initialize OKLAB with HDR headroom support
let ckColor = CKColor(
    okL: 1.0,
    okA: 0.0,
    okB: 0.0,
    opacity: 1.0,
    headroom: 1.5,
    colorSpace: .okLab
)
```
