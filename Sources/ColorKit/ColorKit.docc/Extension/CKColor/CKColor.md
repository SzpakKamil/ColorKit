# ``ColorKit/CKColor``

@Metadata {
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
    @AutomaticSeeAlso(disabled)
    @AutomaticArticleSubheading(disabled)
}

A high-performance, dynamic color container designed for modern Apple platforms.

## Overview

`CKColor` is the core component of the ColorKit framework. It serves as a unified, platform-agnostic representation of color that goes beyond simple static values. Unlike native color types, `CKColor` is built from the ground up to support advanced color science, accessibility compliance, and dynamic environment adaptation.

### Key Features

- **Dynamic Adaptation:** Automatically resolves between light, dark, and high-contrast variants based on the system environment.
- **Color Space Awareness:** Native support for multiple spaces including sRGB, Display P3 (with HDR headroom), Adobe RGB, and perceptual models like OKLAB and LCH.
- **Accessibility First:** Built-in tools for WCAG 2.1 contrast ratios and modern APCA (WCAG 3.0) perceptual contrast calculations.
- **SwiftUI Integration:** Seamlessly conforms to `ShapeStyle` (on supported versions) and provides a direct bridge to SwiftUI's `Color` type.
- **Persistence & Codable:** Fully conforms to `Codable`, allowing complex dynamic color configurations to be easily saved to `UserDefaults`, disk, or transmitted over a network.
- **Technical Precision:** Uses 128-bit value-type identifiers for O(1) hashing and comparison performance.

### Persistence

`CKColor` is designed with data persistence in mind. Because it conforms to `Codable`, you can store user-selected colors directly in `AppStorage` or `UserDefaults`. When encoded, `CKColor` preserves its entire internal state, including all dynamic variants (dark mode, high contrast) and its original color space. This ensures that a color saved in one appearance state correctly adapts when the app is reopened in another.

```swift
// Example: Saving a CKColor to UserDefaults
let themeColor = CKColor.mint
if let encoded = try? JSONEncoder().encode(themeColor) {
    UserDefaults.standard.set(encoded, forKey: "user_theme_color")
}
```

## Topics

### Standard Colors
- ``ColorKit/CKColor/red``
- ``ColorKit/CKColor/orange``
- ``ColorKit/CKColor/yellow``
- ``ColorKit/CKColor/green``
- ``ColorKit/CKColor/mint``
- ``ColorKit/CKColor/teal``
- ``ColorKit/CKColor/cyan``
- ``ColorKit/CKColor/blue``
- ``ColorKit/CKColor/indigo``
- ``ColorKit/CKColor/purple``
- ``ColorKit/CKColor/pink``
- ``ColorKit/CKColor/brown``
- ``ColorKit/CKColor/gray``
- ``ColorKit/CKColor/white``
- ``ColorKit/CKColor/black``
- ``ColorKit/CKColor/standardColors``

### Initializers
- ``init(_:)``
- ``init(nativeColor:)``
- ``init(cgColor:)``
- ``init(ciColor:)``
- ``init(light:dark:highContrast:highContrastDark:colorSpace:)``
- ``init(hexInt:hexIntDark:hexIntHighContrast:hexIntHighContrastDark:colorSpace:)``
- ``init(hexString:hexStringDark:hexStringHighContrast:hexStringHighContrastDark:colorSpace:)``
- ``init(red:green:blue:opacity:headroom:colorSpace:)``
- ``init(hue:saturation:lightness:opacity:headroom:colorSpace:)``
- ``init(cyan:magenta:yellow:key:opacity:headroom:colorSpace:)``
- ``init(L:a:b:opacity:headroom:colorSpace:)``
- ``init(okL:okA:okB:opacity:headroom:colorSpace:)``
- ``init(L:C:h:opacity:headroom:colorSpace:)``

### Modifiers
- ``opacity(_:)``
- ``converted(to:iterations:)``
- ``blended(with:mode:opacity:)``

### Contrast & Accessibility
- ``isLight``
- ``isDark``
- ``wcagLuminance``
- ``linearLuminance``
- ``contrastRatio(with:)``
- ``apcaContrast(on:)``
- ``isAPCAAccessible(on:size:weight:)``
- ``FontWeight``

### Color Components
- ``color``
- ``ciColor``
- ``cgColor``
- ``nativeColor``
- ``colorSpace``
- ``hexString``
- ``luminance``
- ``components(as:)``
- ``rgbComponents()``
- ``hslComponents()``
- ``cmykComponents()``
- ``labComponents()``
- ``okLabComponents()``
- ``lchComponents()``

### Color Spaces & Models
- ``ColorSpace``
- ``RGBA``
- ``HSL``
- ``CMYK``
- ``LAB``
- ``OKLAB``
- ``LCH``

### Description Properties
- ``id``
- ``description``
- ``localizedDescription``
- ``debugDescription``
- ``customMirror``
