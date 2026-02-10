# ColorKit

![Swift Version](https://img.shields.io/badge/Swift-5.9-teal.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%2013.0+%20|%20macOS%2010.15+%20|%20watchOS%206.0+%20|%20tvOS%2013.0+%20|%20visionOS%201.0+-15437D.svg)
![License](https://img.shields.io/badge/License-MIT-C8ECFE.svg)

ColorKit is a powerful, cross-platform Swift package for advanced color manipulation, conversion, and management. It goes far beyond standard system colors, offering a unified API for wide-gamut color spaces, perceptual gamut mapping, HDR support, advanced blending modes, and next-generation accessibility (APCA) checks.

Designed for iOS, macOS, watchOS, tvOS, and visionOS, ColorKit bridges the gap between raw mathematical color models and system UI frameworks (SwiftUI, UIKit, AppKit).

## Features

- **Extensive Color Space Support**: sRGB, Display P3, Adobe RGB, ROMM RGB (ProPhoto), CIE L*a*b*, OKLAB, LCH, HSL, and CMYK.
- **Dynamic Color System**: Define colors with semantic variants for Light, Dark, High Contrast, and High Contrast Dark modes in a single object.
- **Perceptual Gamut Mapping**: Intelligent downscaling from wide gamuts (like P3) to smaller ones (like sRGB) using OKLAB to preserve hue and perceptual lightness.
- **Advanced Blending**: Full support for Photoshop-style blend modes (Multiply, Overlay, Screen, Soft Light, etc.) with correct alpha compositing.
- **Accessibility First**: Built-in tools for WCAG 2.1 contrast ratios and the modern **APCA (WCAG 3.0)** algorithm for precise text-on-background legibility checks.
- **HDR Ready**: Handles extended dynamic range (EDR) values (headroom > 1.0) for accurate processing on HDR displays.
- **Persistence Ready**: Full `Codable` conformance makes it perfect for saving user preferences in **SwiftData**, **AppStorage**, or **UserDefaults**.
- **Localization Ready**: Built-in support for localized color names via `Localizable.xcstrings`, making your UI ready for global audiences.
- **Performance**: Optimized 128-bit identifier system for O(1) diffing and hashing, perfect for high-performance SwiftUI lists.

## Installation

### Swift Package Manager

Add `ColorKit` to your project by adding the package dependency in your `Package.swift` file or via Xcode:

```swift
dependencies: [
    .package(url: "https://github.com/SzpakKamil/ColorKit.git", from: "1.0.0")
]
```

## Usage

### 1. Creating Colors

ColorKit provides a unified `CKColor` type that works seamlessly across platforms.

**Standard & Hex**
```swift
import ColorKit

// Hex String (Auto-normalizes 3, 4, 6, 8 digits)
let brandColor = CKColor(hexString: "#FF5733")

// Hex Integer
let webColor = CKColor(hexInt: 0x663399)

// Standard RGB
let custom = CKColor(red: 0.2, green: 0.4, blue: 0.8, opacity: 1.0)
```

**Advanced Color Models**
Initialize colors using intuitive models like HSL, OKLAB, or CMYK.
```swift
// OKLAB (Perceptually uniform)
let perceptual = CKColor(okL: 0.7, okA: 0.1, okB: -0.1, colorSpace: .okLab)

// HSL
let hslColor = CKColor(hue: 0.5, saturation: 0.8, lightness: 0.5)

// CMYK
let printColor = CKColor(cyan: 0.1, magenta: 0.5, yellow: 0, key: 0.2)
```

**Dynamic Colors (Dark Mode Support)**
Define a single semantic color that adapts to system traits automatically.

```swift
// Using Hex/Strings
let background = CKColor(
    hexString: "#FFFFFF",              // Light Mode
    hexStringDark: "#121212",          // Dark Mode
    hexStringHighContrast: "#FFFFFF",  // High Contrast Light
    hexStringHighContrastDark: "#000000" // High Contrast Dark
)

// Composing from existing CKColors
let lightBrand = CKColor(hexString: "#007AFF")
let darkBrand = CKColor(hexString: "#0A84FF")

let adaptiveBrand = CKColor(
    light: lightBrand,
    dark: darkBrand
)
```

### 2. Persistence (SwiftData & UserDefaults)

Because `CKColor` is `Codable` and `Sendable`, it is ideal for storing user preferences and theme settings.

```swift
// SwiftData example
@Model class UserProfile {
    var favoriteColor: CKColor
    
    init(favoriteColor: CKColor) {
        self.favoriteColor = favoriteColor
    }
}

// AppStorage / UserDefaults example
@AppStorage("accent_color") var accentColor: CKColor = .blue
```

### 3. Localization

ColorKit includes a `Localizable.xcstrings` file that provides localized names for standard colors. You can access the localized description of a color easily:

```swift
let color = CKColor.red
print(color.localizedDescription) // "Red" (or localized equivalent like "Czerwony")
```

### 4. Conversions & Gamut Mapping

Convert seamlessly between color spaces.

```swift
let p3Color = CKColor(red: 1.0, green: 0.0, blue: 0.0, colorSpace: .displayP3)

// Direct conversion
let sRGB = p3Color.converted(to: .sRGB)

// Perceptual Gamut Mapping (OKLAB-based)
// Preserves perceived hue/lightness when fitting wide-gamut colors into sRGB.
let safeForWeb = p3Color.converted(to: .sRGB, iterations: 6)
```

### 5. Manipulation & Blending

Apply complex blend modes that match professional design tools.

```swift
let base = CKColor(hexString: "#E0E0E0")
let layer = CKColor(hexString: "#FF0000").opacity(0.5)

// Blend using standard modes
let multiplied = base.blended(with: layer, mode: .multiply)
let overlayed = base.blended(with: layer, mode: .overlay)
let softLight = base.blended(with: layer, mode: .softLight)
```

### 6. Accessibility Checking

Ensure your UI is accessible with built-in compliance checks.

```swift
let text = CKColor(hexString: "#333333")
let bg = CKColor(hexString: "#FFFFFF")

// Standard WCAG 2.1 Ratio
let ratio = text.contrastRatio(with: bg) // e.g. 12.6

// Modern APCA (WCAG 3.0)
// Returns true if the contrast is sufficient for the given font size and weight.
let isReadable = text.isAPCAAccessible(
    on: bg, 
    size: 16, 
    weight: .regular
) 
```

### 7. SwiftUI Integration

`CKColor` conforms to `ShapeStyle`, so it can be used directly in standard SwiftUI views.

```swift
import SwiftUI
import ColorKit

struct ContentView: View {
    let myColor = CKColor(hexString: "#00AABB")
    
    var body: some View {
        VStack {
            // Use directly as a ShapeStyle
            Circle()
                .fill(myColor) 
            
            // Or convert to native Color
            Text("Hello World")
                .foregroundColor(myColor.color)
        }
    }
}
```

## Supported Platforms

- iOS 13.0+
- macOS 10.15+
- watchOS 6.0+
- tvOS 13.0+
- visionOS 1.0+

## License

This project is licensed under the MIT License.
