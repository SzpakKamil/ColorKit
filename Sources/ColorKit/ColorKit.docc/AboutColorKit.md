# About ColorKit

@Metadata {
    @SupportedLanguage(swift)
    @TitleHeading("Getting Started")
    @Available(iOS, introduced: "13.0")
    @Available(iPadOS, introduced: "13.0")
    @Available(macOS, introduced: "10.15")
    @Available(tvOS, introduced: "13.0")
    @Available(watchOS, introduced: "6.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @PageColor(purple)
}

@Options {
    @AutomaticSeeAlso(disabled)
}

Learn about the powerful, cross-platform `ColorKit` package for advanced color manipulation and conversion.

## Overview

The `ColorKit` package is a comprehensive Swift library designed for advanced color management across all Apple platforms. It extends beyond standard system colors to provide a unified API for wide-gamut color spaces, perceptual gamut mapping, HDR support, and advanced blending modes. Whether you're building a design tool or an accessible user interface, `ColorKit` bridges the gap between raw mathematical color models and system UI frameworks like SwiftUI, UIKit, and AppKit.

## Why Use ColorKit?

The `ColorKit` package empowers developers with tools that surpass standard color APIs:

- **Universal API**: A single `CKColor` type that works seamlessly across iOS, macOS, watchOS, tvOS, and visionOS.
- **Advanced Color Spaces**: Full support for sRGB, Display P3, Adobe RGB, ROMM RGB (ProPhoto), CIE L*a*b*, OKLAB, LCH, HSL, and CMYK.
- **Perceptual Accuracy**: Uses OKLAB-based gamut mapping to preserve hue and perceptual lightness when converting between wide and narrow gamuts.
- **Accessibility First**: Built-in support for WCAG 2.1 contrast ratios and the modern APCA (WCAG 3.0) algorithm for precise readability checks.
- **Dynamic & Semantic**: Define colors with variants for Light, Dark, and High Contrast modes in a single object.
- **Persistence Ready**: Full `Codable` and `Sendable` conformance for easy storage in SwiftData, AppStorage, or UserDefaults.
- **SwiftUI Integration**: Conforms to `ShapeStyle`, allowing direct use in SwiftUI views.

## Key Capabilities

The `ColorKit` package offers a wide range of functionality for color-centric applications:

- **Color Creation**:
  - Initialize via Hex strings (3, 4, 6, 8 digits) or Hex integers.
  - Create colors using specialized models like OKLAB, HSL, or CMYK.
  - Define adaptive colors that automatically respond to system appearance changes.

- **Conversions & Blending**:
  - Convert between any supported color space with optional perceptual gamut mapping.
  - Apply Photoshop-style blend modes (Multiply, Overlay, Screen, Soft Light, etc.) with correct alpha handling.

- **Accessibility**:
  - Calculate contrast ratios following WCAG standards.
  - Perform APCA (Advanced Perceptual Contrast Algorithm) checks for modern typography needs.

- **Localization**:
  - Built-in support for localized color names (e.g., "Red" vs. "Czerwony") via standard localization files.

Example:

```swift
import SwiftUI
import ColorKit

struct ColorExampleView: View {
    // A dynamic color that supports Light and Dark modes
    let brandColor = CKColor(hexString: "#007AFF", hexStringDark: "#0A84FF")
    
    var body: some View {
        VStack {
            Circle()
                .fill(brandColor) // CKColor works as a ShapeStyle
                .frame(width: 100, height: 100)
            
            Text("Perceptual Contrast")
                .foregroundColor(brandColor.color)
                .onAppear {
                    let bg = CKColor.white
                    let readable = brandColor.isAPCAAccessible(on: bg, size: 16, weight: .regular)
                    print("Is readable: \(readable)")
                }
        }
    }
}
```

## Target Use Cases

The `ColorKit` package is ideal for:
- **Design Tools**: Building apps that require precise color manipulation and professional blending modes.
- **Theming Systems**: Creating complex, adaptive color themes that persist across user sessions.
- **Accessibility-Focused Apps**: Ensuring high standards of readability with modern contrast algorithms.
- **Cross-Platform Development**: Sharing color logic and definitions between iOS and macOS targets effortlessly.

## Next Steps

- Learn how to integrate the package in <doc:SetUp>.
- Explore the main API reference in <doc:ColorKit>.
