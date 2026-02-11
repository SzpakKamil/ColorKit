# ``ColorKit/CKColor/luminance``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("Luminance", style: symbol)
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

The perceptual luminance of the color.

## Overview

The `luminance` property provides a measurement of the color's lightness as perceived by the human eye. It uses the OKLAB color model's L-channel for calculation, ensuring perceptual uniformity.

### Details

- **Algorithm:** OKLAB (L-channel).
- **Range:** 0.0 (Black) to 1.0 (White). Values may exceed 1.0 for HDR colors with headroom.
- **Dynamic Behavior:** The returned value is calculated based on the primary components of the `CKColor` instance.

### Example Usage

```swift
import ColorKit

let color = CKColor.yellow
if color.luminance > 0.5 {
    print("This is a light color")
}
```
