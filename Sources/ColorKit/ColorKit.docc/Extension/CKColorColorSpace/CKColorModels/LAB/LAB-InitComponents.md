# ``ColorKit/CKColor/LAB/init(L:a:b:alpha:headroom:)``

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

Creates a LAB structure from individual components.

### Parameters

- `L`: Lightness (0.0 to 100.0).
- `a`: Green–Red opponent axis.
- `b`: Blue–Yellow opponent axis.
- `alpha`: Opacity (0.0 to 1.0).
- `headroom`: Optional HDR headroom multiplier.

### Example Usage

```swift
import ColorKit

let neutralGray = CKColor.LAB(L: 50.0, a: 0.0, b: 0.0)
```
