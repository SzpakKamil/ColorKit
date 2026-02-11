# ``SwiftUICore/Binding/asCIColor``

@Metadata {
    @TitleHeading("Binding Extensions")
    @DisplayName("asCIColor", style: symbol)
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

Projections for `Binding<CKColor>` to `Binding<CIColor>`.

## Overview

The `asCIColor` property provides a read-write bridge between a `CKColor` binding and a `CIColor` binding. This is useful when you need to drive Core Image filter parameters directly from a `CKColor` state.

### Details

- **Type:** `Binding<CIColor>`
- **Availability:** Only available on platforms where Core Image is supported.
- **Behavior:**
    - **Get:** Returns the `ciColor` property of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` using a new `CIColor`.
