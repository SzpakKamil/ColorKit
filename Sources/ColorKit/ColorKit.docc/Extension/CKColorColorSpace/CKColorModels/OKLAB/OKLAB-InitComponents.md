# ``ColorKit/CKColor/OKLAB/init(L:a:b:alpha:headroom:)``

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

Creates an OKLAB structure from individual components.

### Parameters

- `L`: Perceptual lightness.
- `a`: Green–Red axis.
- `b`: Blue–Yellow axis.
- `alpha`: Opacity (0.0 to 1.0).
- `headroom`: Optional HDR headroom multiplier.

### Example Usage

```swift
import ColorKit

let okColor = CKColor.OKLAB(L: 0.6, a: 0.1, b: 0.1)
```
