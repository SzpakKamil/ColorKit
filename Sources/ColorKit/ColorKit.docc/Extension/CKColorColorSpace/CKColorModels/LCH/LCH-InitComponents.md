# ``ColorKit/CKColor/LCH/init(L:C:h:alpha:headroom:)``

@Metadata {
    @TitleHeading("Color Models")
    @DisplayName("Init from Components", style: symbol)
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

Creates an LCH structure from individual components.

### Parameters

- `L`: Lightness.
- `C`: Chroma (intensity).
- `h`: Hue angle (0° to 360°).
- `alpha`: Opacity (0.0 to 1.0).
- `headroom`: Optional HDR headroom multiplier.

### Example Usage

```swift
import ColorKit

let vividOrange = CKColor.LCH(L: 67.0, C: 80.0, h: 45.0)
```
