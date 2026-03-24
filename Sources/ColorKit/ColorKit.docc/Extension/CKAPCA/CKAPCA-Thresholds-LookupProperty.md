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

Closure determining required contrast based on font characteristics.

## Overview

Stores the logic for evaluating color pairing accessibility. ``ColorKit/CKColor/isAPCAAccessible(on:size:weight:)`` executes this closure to find the target `Lc` value for the given font size and weight.

### Details

- **Type:** ``ColorKit/CKAPCA/Thresholds/Lookup``
- **Default:** ``ColorKit/CKAPCA/Thresholds/silver`` logic.
