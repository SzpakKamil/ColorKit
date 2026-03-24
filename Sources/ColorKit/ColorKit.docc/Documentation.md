# ``ColorKit``

Advanced Color Manipulation & Management

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

## Overview

`ColorKit` provides a unified Swift API for advanced color manipulation, conversion, and accessibility. It supports wide-gamut color spaces (Display P3, Adobe RGB), perceptual gamut mapping (OKLAB), and standard blending modes. Includes WCAG and APCA contrast validation. Use it for dynamic theming, `Codable` color persistence, and complex transformations.

@Image(source: "ColorKit-Banner", alt: "ColorKit banner showing color spectrums and blending examples.")

## Getting Started

@Links(visualStyle: detailedGrid) {
    - <doc:AboutColorKit>
    - <doc:SetUp>
    - <doc:ColorOperations>
}

## Topics

### Essentials
- <doc:AboutColorKit>
- <doc:SetUp>
- <doc:ColorOperations>

### Core Types
- ``ColorKit/CKColor``

### Color Models
- ``ColorKit/CKColor/RGBA``
- ``ColorKit/CKColor/HSL``
- ``ColorKit/CKColor/OKLAB``
- ``ColorKit/CKColor/LAB``
- ``ColorKit/CKColor/LCH``
- ``ColorKit/CKColor/CMYK``

### Native Bridges
- ``CoreGraphics/CGColor/``
- ``CoreImage/CIColor/``
- ``SwiftUICore/Color/``
- ``SwiftUICore/Binding/``
- ``UIKit/UIColor``
- ``AppKit/UIColor``

### Accessibility
- ``ColorKit/CKAPCA``
- ``ColorKit/CKColor/FontWeight``

### Blending and Manipulation
- ``ColorKit/CKBlendMode``
