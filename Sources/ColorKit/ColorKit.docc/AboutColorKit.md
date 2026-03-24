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

Manage colors across all Apple platforms with `ColorKit`.

## Overview

`ColorKit` is a Swift library for advanced color management. It bridges raw mathematical color models and system UI frameworks (SwiftUI, UIKit, AppKit) to support wide-gamut color spaces, perceptual gamut mapping, HDR, and blending modes.

## Features

- **Universal API**: A single `CKColor` type works on iOS, macOS, watchOS, tvOS, and visionOS.
- **Advanced Color Spaces**: Supports sRGB, Display P3, Adobe RGB, ROMM RGB (ProPhoto), CIE L*a*b*, OKLAB, LCH, HSL, and CMYK.
- **Perceptual Accuracy**: Uses OKLAB-based gamut mapping to preserve hue and lightness during conversions.
- **Accessibility**: Includes WCAG 2.1 contrast ratios and APCA (WCAG 3.0) algorithms.
- **Dynamic & Semantic**: Defines colors with Light, Dark, and High Contrast variants.
- **Persistence**: Conforms to `Codable` and `Sendable` for storage in SwiftData, AppStorage, or UserDefaults.
- **SwiftUI Integration**: Conforms to `ShapeStyle` for direct use in views.

## Capabilities

- **Creation**: Initialize via Hex strings/integers, or specialized models (OKLAB, HSL, CMYK). Define adaptive colors.
- **Conversions & Blending**: Convert between color spaces with perceptual mapping. Apply blend modes (Multiply, Overlay, Screen) with alpha handling.
- **Accessibility**: Calculate WCAG contrast ratios and perform APCA checks.
- **Localization**: Localize color names (e.g., "Red" vs. "Czerwony").

Example:

```swift
import SwiftUI
import ColorKit

struct ColorExampleView: View {
    // Dynamic color for Light and Dark modes
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

## Use Cases

- **Design Tools**: Precise color manipulation and blending.
- **Theming**: Adaptive themes that persist across sessions.
- **Accessibility**: Readability checks with modern algorithms.
- **Cross-Platform**: Share color logic between iOS and macOS.

## Next Steps

- <doc:SetUp>
- <doc:ColorKit>
