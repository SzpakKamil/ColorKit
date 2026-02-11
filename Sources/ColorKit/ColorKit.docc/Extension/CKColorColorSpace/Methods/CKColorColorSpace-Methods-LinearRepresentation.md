# ``ColorKit/CKColor/ColorSpace/linearRepresentation(for:)``

@Metadata {
    @TitleHeading("Color Space")
    @DisplayName("Linear Representation", style: symbol)
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

Resolves the given components to their linearized representation.

## Overview

The `linearRepresentation(for:)` method transforms a full set of RGBA components into their linear light equivalents. 

Beyond simply applying the transfer function to each channel, this method also accounts for **HDR headroom**. For wide-gamut spaces like `displayP3`, it multiplies the linearized RGB components by the provided headroom to accurately represent high-dynamic-range intensities that exceed standard peak brightness.

### Parameters

- `components`: The ``CKColor/RGBA`` components to linearize.

### Return Value

A new ``CKColor/RGBA`` instance containing the linearized intensities.

### Example Usage

```swift
import ColorKit

let space = CKColor.ColorSpace.displayP3
let rgba = CKColor.RGBA(r: 1.0, g: 0.0, b: 0.0, a: 1.0, headroom: 2.0)

let linear = space.linearRepresentation(for: rgba)
// Resulting R will be 2.0 (representing HDR peak red)
```
