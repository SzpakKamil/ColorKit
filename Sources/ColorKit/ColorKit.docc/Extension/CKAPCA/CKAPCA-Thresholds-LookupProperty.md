# ``ColorKit/CKAPCA/Thresholds/lookup``

@Metadata {
    @TitleHeading("APCA Thresholds")
    @DisplayName("Lookup Closure", style: symbol)
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

The closure determining the required contrast based on font characteristics.

## Overview

This property stores the actual logic used to evaluate if a color pairing is accessible. When ``ColorKit/CKColor/isAPCAAccessible(on:size:weight:)`` is called, it executes this closure to find the target `Lc` value for the given font size and weight.

### Details

- **Type:** ``ColorKit/CKAPCA/Thresholds/Lookup``
- **Default:** Initialized with the ``ColorKit/CKAPCA/Thresholds/silver`` logic by default.
