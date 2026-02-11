# ``ColorKit/CKAPCA``

@Metadata {
    @TitleHeading("Contrast (WCAG)")
    @DisplayName("APCA Configuration", style: symbol)
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
    @AutomaticArticleSubheading(disabled)
}

A container for Advanced Perceptual Contrast Algorithm (APCA) configurations.

## Overview

`CKAPCA` serves as the primary namespace for the settings and mathematical constants that drive modern perceptual contrast calculations within ColorKit. It allows developers to customize the behavior of the APCA engine, including adjusting algorithm coefficients or defining custom lookup tables for accessibility compliance.

## Topics

### Configuration
- ``sharedConstants``
- ``sharedThresholds``

### Supporting Types
- ``Constants``
- ``Thresholds``
