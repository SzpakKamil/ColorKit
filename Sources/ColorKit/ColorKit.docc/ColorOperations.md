# Color Operations

@Metadata {
    @SupportedLanguage(swift)
    @TitleHeading("Functionality")
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

Learn about the advanced color operations available in the `ColorKit` package, including conversion, blending, and accessibility checks.

## Overview

`ColorKit` provides a comprehensive suite of operations for manipulating and analyzing colors. These operations are primarily exposed as methods and properties on the `CKColor` struct, ensuring a consistent and discoverable API.

## Operations

### Conversions & Gamut Mapping

- ``ColorKit/CKColor/converted(to:iterations:)``  
  Converts a color to a target color space with optional perceptual gamut mapping.  
  **Available:** all platforms

- ``ColorKit/CKColor/colorSpace``  
  The current color space of the color.  
  **Available:** all platforms

### Blending

- ``ColorKit/CKColor/blended(with:mode:opacity:)``  
  Blends the current color with another using a specified ``CKBlendMode``.  
  **Available:** all platforms

### Accessibility & Contrast

- ``ColorKit/CKColor/contrastRatio(with:)``  
  Calculates the WCAG 2.1 contrast ratio between two colors.  
  **Available:** all platforms

- ``ColorKit/CKColor/apcaContrast(on:)``  
  Calculates the APCA (Advanced Perceptual Contrast Algorithm) lightness contrast.  
  **Available:** all platforms

- ``ColorKit/CKColor/isAPCAAccessible(on:size:weight:)``  
  Determines if a color combination meets APCA readability thresholds for a given font.  
  **Available:** all platforms

### Luminance & Lightness

- ``ColorKit/CKColor/linearLuminance``  
  Returns the linear luminance (Y) using Rec. 709 coefficients, HDR-compatible.  
  **Available:** all platforms

- ``ColorKit/CKColor/wcagLuminance``  
  Returns the relative luminance clamped to the SDR range (0-1).  
  **Available:** all platforms

## Example

```swift
import ColorKit

let base = CKColor(hexString: "#E0E0E0")
let layer = CKColor(hexString: "#FF0000").opacity(0.5)

// 1. Blending
let multiplied = base.blended(with: layer, mode: .multiply)

// 2. Conversion with Gamut Mapping
let p3Color = CKColor(red: 1.0, green: 0.0, blue: 0.0, colorSpace: .displayP3)
let sRGB = p3Color.converted(to: .sRGB, iterations: 6) // Perceptual mapping

// 3. Accessibility Check
let isReadable = sRGB.isAPCAAccessible(on: base, size: 18, weight: .bold)
print("Contrast is sufficient: \(isReadable)")
```

## Next Steps

- Explore the main API reference in <doc:ColorKit>.
