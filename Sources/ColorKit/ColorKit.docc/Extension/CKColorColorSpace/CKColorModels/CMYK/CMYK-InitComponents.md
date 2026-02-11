# ``ColorKit/CKColor/CMYK/init(c:m:y:k:a:headroom:)``

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

Creates a CMYK structure from individual components.

### Parameters

- `c`: Cyan channel (0.0 to 1.0).
- `m`: Magenta channel (0.0 to 1.0).
- `y`: Yellow channel (0.0 to 1.0).
- `k`: Key (Black) channel (0.0 to 1.0).
- `a`: Alpha (opacity) value (0.0 to 1.0).
- `headroom`: Optional HDR headroom multiplier.

### Example Usage

```swift
import ColorKit

let cyan = CKColor.CMYK(c: 1.0, m: 0.0, y: 0.0, k: 0.0)
```
