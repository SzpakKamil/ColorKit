# ``ColorKit/CKColor/HSL/init(h:s:l:a:headroom:)``

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

Creates an HSL structure from individual Hue, Saturation, and Lightness components.

## Overview

### Parameters

- `h`: Hue angle (0.0 to 1.0).
- `s`: Saturation (0.0 to 1.0).
- `l`: Lightness (0.0 to 1.0).
- `a`: Alpha (0.0 to 1.0).
- `headroom`: Optional HDR headroom.

### Example Usage

```swift
import ColorKit

let color = CKColor.HSL(h: 0.0, s: 1.0, l: 0.5, a: 1.0) // Pure Red
```
