# ``ColorKit``

Advanced Color Manipulation, Conversion, and Management for Swift.

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

The `ColorKit` package provides a powerful, cross-platform Swift API for advanced color manipulation, conversion, and accessibility management. Supporting iOS, macOS, watchOS, tvOS, and visionOS, it offers developers a unified toolset for handling wide-gamut color spaces (like Display P3 and Adobe RGB), perceptual gamut mapping using OKLAB, and Photoshop-style blending modes. With built-in support for WCAG and APCA contrast checks, `ColorKit` ensures your application's UI is both vibrant and accessible.

Whether you're creating dynamic themes with Dark Mode support, persisting user color choices via `Codable`, or performing complex color space transformations, `ColorKit` simplifies the process with an intuitive, SwiftUI-friendly API.

@Image(source: "ColorKit-Banner", alt: "")

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
