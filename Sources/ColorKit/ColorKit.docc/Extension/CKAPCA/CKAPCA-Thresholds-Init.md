# ``ColorKit/CKAPCA/Thresholds/init(lookup:)``

@Metadata {
    @TitleHeading("APCA Thresholds")
    @DisplayName("Init Thresholds", style: symbol)
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

Creates a custom accessibility threshold lookup table.

## Overview

Define custom logic for determining accessibility compliance.

### Parameters

- `lookup`: Closure taking font `size` (Double) and ``ColorKit/CKColor/FontWeight``, returning the minimum required `Lc` value.
