# ColorKit
![Swift Version](https://img.shields.io/badge/Swift-5.9-teal.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%2013.0+%20|%20macOS%2010.15+%20|%20watchOS%206.0+%20|%20tvOS%2013.0+%20|%20visionOS%201.0+-15437D.svg)
![License](https://img.shields.io/badge/License-MIT-C8ECFE.svg)

![Banner](./Resources/ColorKit-Banner.webp#gh-light-mode-only)
![Banner](./Resources/ColorKit-Banner~dark.webp#gh-dark-mode-only)

`ColorKit` handles color conversions, perceptual gamut mapping, blending, and accessibility checks for Swift. Bridges `UIColor`, `NSColor`, and SwiftUI's `Color`.

View the [Documentation](https://documentation.kamilszpak.com/documentation/colorkit).

---

## Table of Contents

- [Features](#features)
- [Usage](#usage)
- [Installation](#installation)
- [Requirements](#requirements)
- [License](#license)

## Features

*   **Broad Support**: sRGB, Display P3, Adobe RGB, ROMM RGB, CIE L*a*b*, OKLAB, LCH, CMYK.
*   **Dynamic & Semantic**: Light, dark, and high-contrast variants in one `CKColor`.
*   **Perceptual Gamut Mapping**: Preserves hue/lightness when converting wide-gamut (P3) to smaller spaces via OKLAB.
*   **Blending Modes**: Multiply, Overlay, Screen, Soft Light with correct alpha compositing.
*   **Accessibility**: WCAG 2.1 contrast ratios and APCA (WCAG 3.0) compliance.
*   **HDR Ready**: Handles extended dynamic range (EDR).
*   **Codable**: Persists in SwiftData, AppStorage, or UserDefaults.

## Usage

### Create and Use Colors

```swift
import ColorKit
import SwiftUI

// Hex String
let brandColor = CKColor(hexString: "#FF5733")

// Adaptive Semantic Color
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

```swift
// P3 to sRGB
let p3Color = CKColor(red: 1.0, green: 0.0, blue: 0.0, colorSpace: .displayP3)
let sRGBColor = p3Color.converted(to: .sRGB)

// OKLAB
let oklabColor = CKColor(okL: 0.7, okA: 0.1, okB: -0.1, colorSpace: .okLab)
```

### Accessibility Checks

```swift
let text = CKColor(hexString: "#333333")
let bg = CKColor(hexString: "#FFFFFF")

// APCA check for 16pt text
let isReadable = text.isAPCAAccessible(on: bg, size: 16, weight: .regular)
```

## Installation

### Swift Package Manager
Add `ColorKit` in `Package.swift` or via Xcode.

```swift
dependencies: [
    .package(url: "https://github.com/SzpakKamil/ColorKit.git", from: "1.0.0")
]
```

### Agent Skill
Install the Agent Skill for AI assistance.
```bash
npx skills add https://github.com/SzpakKamil/AgentSkills --skill ColorKit
```

## Requirements
* **Platforms**: iOS 13.0+, macOS 10.15+, tvOS 13.0+, watchOS 6.0+, visionOS 1.0+
* **Tools**: Swift 5.9+, Xcode 15.0+

## License
MIT
