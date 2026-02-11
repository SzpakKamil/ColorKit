# ``ColorKit/CKAPCA/Thresholds/silver``

@Metadata {
    @TitleHeading("APCA Thresholds")
    @DisplayName("Silver Standard", style: symbol)
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

The default accessibility threshold table based on the APCA Silver level.

## Overview

This configuration provides a balanced set of contrast requirements suitable for most web and mobile applications. It automatically increases the required `Lc` as font size decreases or weight becomes thinner.

### Threshold Examples

- **Body Text (Regular, 18pt):** Requires at least 75 Lc.
- **Large Headlines (Bold, 24pt):** Requires at least 60 Lc.
- **Small Captions (Light, 12pt):** Requires 90 Lc.
