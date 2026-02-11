# ColorKit

![Swift Version](https://img.shields.io/badge/Swift-5.9-teal.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%2013.0+%20|%20macOS%2010.15+%20|%20watchOS%206.0+%20|%20tvOS%2013.0+%20|%20visionOS%201.0+-15437D.svg)
![License](https://img.shields.io/badge/License-MIT-C8ECFE.svg)
![Banner](./Resources/ColorKit-Banner.webp#gh-light-mode-only)
![Banner](./Resources/ColorKit-Banner~dark.webp#gh-dark-mode-only)


ColorKit is a powerful, cross-platform Swift package for advanced color manipulation, conversion, and management. It goes far beyond standard system colors, offering a unified API for wide-gamut color spaces, perceptual gamut mapping, HDR support, advanced blending modes, and next-generation accessibility (APCA) checks.

Designed for iOS, macOS, watchOS, tvOS, and visionOS, ColorKit bridges the gap between raw mathematical color models and system UI frameworks (**SwiftUI**, **UIKit**, **AppKit**).

## Features

- **Extensive Color Space Support**: sRGB, Display P3, Adobe RGB, ROMM RGB (ProPhoto), CIE L*a*b*, OKLAB, LCH, HSL, and CMYK.
- **Dynamic Color System**: Define colors with semantic variants for Light, Dark, High Contrast, and High Contrast Dark modes in a single object.
- **Perceptual Gamut Mapping**: Intelligent downscaling from wide gamuts (like P3) to smaller ones (like sRGB) using OKLAB to preserve hue and perceptual lightness.
- **Advanced Blending**: Full support for Photoshop-style blend modes (Multiply, Overlay, Screen, Soft Light, etc.) with correct alpha compositing.
- **Accessibility First**: Built-in tools for WCAG 2.1 contrast ratios and the modern **APCA (WCAG 3.0)** algorithm for precise text-on-background legibility checks.
- **HDR & wide-gamut Ready**: Handles extended dynamic range (EDR) values (headroom > 1.0) and preserves technical precision across wide gamuts.
- **Persistence Ready**: Full `Codable` conformance makes it perfect for saving user preferences in **SwiftData**, **AppStorage**, or **UserDefaults**.
- **Localization Ready**: Built-in support for localized color names in all native iOS languages via ``CKColor/localizedDescription``.
- **High Performance**: Optimized 128-bit value-type identifier system for O(1) diffing and hashing.

## Installation

### Swift Package Manager

Add `ColorKit` to your project via Xcode (**File > Add Package Dependency**) or by adding it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/SzpakKamil/ColorKit.git", from: "1.0.0")
]
```

### Expert Guidance (CLI Agent Skill)

Get expert guidance on color manipulation and conversion directly in your terminal by installing the ColorKit skill for your CLI agent.

**Using skills.sh:**
```bash
npx skills add https://github.com/SzpakKamil/AgentSkills --skill ColorKit
```

**Using ClawdHub:**
```bash
npx dlx clawdhub@latest install colorkit
```

## Quick Start

### 1. Creating Dynamic Colors

ColorKit provides a unified `CKColor` type that automatically adapts to system traits.

```swift
import ColorKit

// Initialize from Hex String (Supports 3, 4, 6, 8 digits)
let brandColor = CKColor(hexString: "#FF5733")

// Define a semantic adaptive color
let background = CKColor(
    hexString: "#FFFFFF",              // Light Mode
    hexStringDark: "#121212",          // Dark Mode
    hexStringHighContrast: "#FFFFFF",  // High Contrast Light
    hexStringHighContrastDark: "#000000" // High Contrast Dark
)
```

### 2. Advanced Color Models

Work directly with perceptually uniform or design-oriented coordinate systems.

```swift
// OKLAB (Perceptually uniform, HDR-ready)
let oklab = CKColor(okL: 0.7, okA: 0.1, okB: -0.1, colorSpace: .okLab)

// LCH (Cylindrical representation: Lightness, Chroma, Hue)
let lch = CKColor(L: 50.0, C: 100.0, h: 40.0, colorSpace: .lch)

// CMYK (Print-oriented)
let print = CKColor(cyan: 0.1, magenta: 0.5, yellow: 0, key: 0.2)
```

### 3. Modern Accessibility (APCA)

Move beyond legacy ratios with the Advanced Perceptual Contrast Algorithm.

```swift
let text = CKColor(hexString: "#333333")
let bg = CKColor(hexString: "#FFFFFF")

// Check if readable for 16pt regular text under WCAG 3.0 standards
let isReadable = text.isAPCAAccessible(on: bg, size: 16, weight: .regular) 
```

### 4. Perceptual Gamut Mapping

Convert colors between spaces while preserving their visual intent.

```swift
let p3Color = CKColor(red: 1.0, green: 0.0, blue: 0.0, colorSpace: .displayP3)

// Intelligent mapping from wide P3 to narrow sRGB
let sRGB = p3Color.converted(to: .sRGB, iterations: 6)
```

### 5. SwiftUI Integration

`CKColor` conforms to `ShapeStyle` and bridges seamlessly to native types.

```swift
import SwiftUI
import ColorKit

struct ColorPreview: View {
    let accent = CKColor.mint
    
    var body: some View {
        Circle()
            .fill(accent) // Used directly as ShapeStyle
        
        Text(accent.localizedDescription)
            .foregroundStyle(accent)
    }
}
```

## Documentation

Exhaustive documentation is available via DocC in the `Sources/ColorKit/ColorKit.docc` directory. It covers:

- **CKColor**: Modifiers, Initializers, and Description Properties.
- **ColorSpace**: Technical details on standard RGB, Extended/HDR, and Wide Gamut spaces.
- **ColorModels**: Mathematical specifications for RGBA, HSL, CMYK, LAB, OKLAB, and LCH.
- **Blending**: Detailed explanation of all ``CKBlendMode`` cases.
- **Contrast**: Implementation details for WCAG 2.1 and APCA (WCAG 3.0).
- **Bridges**: Extension details for `Color`, `CGColor`, `CIColor`, and `UIColor`/`NSColor`.

## Credits & References

- **OKLAB**: Implementation based on Björn Ottosson's "A perceptual color space for image processing" (2020).
- **APCA**: Based on the Advanced Perceptual Contrast Algorithm W3 Silver level draft.
- **Color Spaces**: Adheres to IEC 61966-2-1 (sRGB), SMPTE RP 431-2 (Display P3), and ISO 22028-2 (ROMM RGB).

## License

This project is licensed under the MIT License.
