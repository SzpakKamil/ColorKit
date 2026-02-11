# ``ColorKit/CKColor/init(_:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init Color", style: symbol)
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

@Options {
    @AutomaticTitleHeading(enabled)
    @AutomaticArticleSubheading(disabled)
}

Creates a dynamic `CKColor` from a SwiftUI `Color`.

## Overview

This initializer provides a high-level entry point for integrating existing SwiftUI designs with ColorKit. It accepts a standard SwiftUI `Color` and performs a deep analysis to extract its underlying components. 

During initialization, it automatically detects if the source color is a dynamic system color (like `.accentColor` or `.primary`) and resolves its variants for light, dark, and high-contrast environments. It also identifies the original color space to ensure that any subsequent ColorKit operations, such as blending or gamut mapping, maintain maximum color fidelity.

### Example Usage

#### Required Parameters
```swift
import SwiftUI
import ColorKit

// Creates a CKColor from a standard SwiftUI color
let color = CKColor(Color.red)
```

#### Full Initialization
```swift
import SwiftUI
import ColorKit

// Creates a CKColor from a dynamic accent color
let customColor = Color.accentColor
let ckColor = CKColor(customColor)
```
