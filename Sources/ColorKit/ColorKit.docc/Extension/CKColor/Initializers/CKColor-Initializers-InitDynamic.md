# ``ColorKit/CKColor/init(light:dark:highContrast:highContrastDark:colorSpace:)``

@Metadata {
    @TitleHeading("Initializers")
    @DisplayName("Init Dynamic", style: symbol)
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

Creates a dynamic `CKColor` from multiple `CKColor` instances.

## Overview

This initializer provides complete control over the dynamic behavior of a color by allowing you to manually specify different `CKColor` instances for each supported system appearance. This is the most flexible way to define custom dynamic colors that go beyond simple dark mode support.

You must provide a `light` variant as the primary base. Optional parameters allow you to define distinct colors for `dark` mode, as well as `highContrast` (light) and `highContrastDark` modes. If any optional variant is omitted, ColorKit will intelligently generate a suitable fallback using perceptual algorithms (e.g., adjusting contrast or lightness based on the primary color). The resulting color will seamlessly transition between these states as the system environment changes.

### Example Usage

#### Required Parameters
```swift
import ColorKit

// Creates a simple color that uses standard algorithmic fallbacks for other modes
let light = CKColor.red
let ckColor = CKColor(light: light)
```

#### Full Initialization
```swift
import ColorKit

// Creates a fully custom dynamic color with explicit variants for every environment
let light = CKColor.red
let dark = CKColor.blue
let ckColor = CKColor(
    light: light,
    dark: dark,
    highContrast: CKColor.white,
    highContrastDark: CKColor.gray,
    colorSpace: .displayP3
)
```
