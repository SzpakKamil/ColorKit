# ``ColorKit/CKColor/linearLuminance``

@Metadata {
    @TitleHeading("Color Components")
    @DisplayName("Linear Luminance", style: symbol)
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

The linear relative luminance (Y) of the color.

## Overview

The `linearLuminance` property calculates the relative luminance using Rec. 709 coefficients ($0.2126R + 0.7152G + 0.0722B$) in linear space. This property is HDR-compatible and does not clamp values, making it suitable for high-precision contrast math.

### Details

- **Coefficients:** Rec. 709 ($0.2126, 0.7152, 0.0722$).
- **HDR Compatibility:** Does not clamp to [0, 1], preserving Display P3 headroom.
- **Usage:** Preferred over standard `luminance` for advanced contrast algorithms like APCA.

### Example Usage

```swift
import ColorKit

let color = CKColor.white
print(color.linearLuminance) // 1.0
```
