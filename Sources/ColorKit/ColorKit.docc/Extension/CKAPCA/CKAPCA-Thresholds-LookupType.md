# ``ColorKit/CKAPCA/Thresholds/Lookup``

@Metadata {
    @TitleHeading("APCA Thresholds")
    @DisplayName("Lookup Typealias", style: symbol)
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

A typealias for the contrast lookup closure.

## Overview

`Lookup` defines the signature for closures used to determine accessibility compliance. It takes typographical characteristics as input and returns the minimum required APCA contrast.

### Signature

```swift
(_ size: Double, _ weight: CKColor.FontWeight) -> Double
```

- **size**: The font size in points.
- **weight**: The ``ColorKit/CKColor/FontWeight`` of the text.
- **Returns**: The minimum required Lightness Contrast (`Lc`) value.
