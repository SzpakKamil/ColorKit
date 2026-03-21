# ColorKit
![Swift Version](https://img.shields.io/badge/Swift-5.9-teal.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%2013.0+%20|%20macOS%2010.15+%20|%20watchOS%206.0+%20|%20tvOS%2013.0+%20|%20visionOS%201.0+-15437D.svg)
![License](https://img.shields.io/badge/License-MIT-C8ECFE.svg)

![Banner](./Resources/ColorKit-Banner.webp#gh-light-mode-only)
![Banner](./Resources/ColorKit-Banner~dark.webp#gh-dark-mode-only)

Advanced color manipulation for Swift. `ColorKit` unifies color space conversions, perceptual gamut mapping, blending modes, and accessibility checks. Bridges platform-native types (`UIColor`, `NSColor`) and SwiftUI's `Color`.

View the [Documentation](https://documentation.kamilszpak.com/documentation/colorkit).

---

## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [Installation](#installation)
- [Requirements](#requirements)
- [License](#license)

## Features

*   **Broad Color Space Support**: Convert between sRGB, Display P3, Adobe RGB, ROMM RGB (ProPhoto), CIE L*a*b*, OKLAB, LCH, and CMYK.
*   **Dynamic & Semantic Colors**: Define light, dark, and high-contrast variants in a single `CKColor` object.
*   **Perceptual Gamut Mapping**: Preserve hue and lightness when converting wide-gamut (P3) to smaller spaces (sRGB) via OKLAB.
*   **Advanced Blending Modes**: Apply blending modes like Multiply, Overlay, Screen, and Soft Light with correct alpha compositing.
*   **Modern Accessibility**: Check WCAG 2.1 contrast ratios and APCA (WCAG 3.0) compliance.
*   **HDR & Wide-Gamut Ready**: Handle extended dynamic range (EDR) values and maintain wide-gamut precision.
*   **Codable Conformance**: Persist colors in SwiftData, AppStorage, or UserDefaults.

## Usage

### Creating and Using Colors
Use `CKColor` to adapt to system traits and bridge native types.

```swift
import ColorKit
import SwiftUI

// Initialize from a Hex String
let brandColor = CKColor(hexString: "#FF5733")

// Define a semantic color that adapts to system appearance
let background = CKColor(
    hexString: "#FFFFFF",        // Light Mode
    hexStringDark: "#121212"     // Dark Mode
)

struct ContentView: View {
    var body: some View {
        Circle().fill(brandColor) // Conforms to ShapeStyle
    }
}
```

### Color Space Conversion
Manipulate colors in perceptually uniform or design-oriented coordinate systems.

```swift
// Convert a Display P3 red to sRGB
let p3Color = CKColor(red: 1.0, green: 0.0, blue: 0.0, colorSpace: .displayP3)
let sRGBColor = p3Color.converted(to: .sRGB)

// Create a color in the OKLAB space
let oklabColor = CKColor(okL: 0.7, okA: 0.1, okB: -0.1, colorSpace: .okLab)
```

### Accessibility Checks
Validate accessibility with the Advanced Perceptual Contrast Algorithm (APCA).

```swift
let text = CKColor(hexString: "#333333")
let bg = CKColor(hexString: "#FFFFFF")

// Check contrast based on WCAG 3.0 standards for 16pt text
let isReadable = text.isAPCAAccessible(on: bg, size: 16, weight: .regular)
```

## Installation

### Swift Package Manager
Add `ColorKit` as a dependency in your `Package.swift` file or via Xcode.

```swift
dependencies: [
    .package(url: "https://github.com/SzpakKamil/ColorKit.git", from: "1.0.0")
]
```

### Agent Skill
Install the Agent Skill for AI-assisted workflows.
```bash
npx skills add https://github.com/SzpakKamil/AgentSkills --skill ColorKit
```

## Requirements
* **Platforms**: iOS 13.0+, macOS 10.15+, tvOS 13.0+, watchOS 6.0+, visionOS 1.0+
* **Tools**: Swift 5.9+, Xcode 15.0+

## License
`ColorKit` is released under the MIT license.
