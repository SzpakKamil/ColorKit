# ``SwiftUICore/Binding/asCGColor``

@Metadata {
    @TitleHeading("Binding Extensions")
    @DisplayName("asCGColor", style: symbol)
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

Projections for `Binding<CKColor>` to `Binding<CGColor>`.

## Overview

The `asCGColor` property provides a read-write bridge between a `CKColor` binding and a `CGColor` binding. This allows you to use `CKColor` state with APIs that require a `Binding<CGColor>`, such as custom color pickers or low-level drawing utilities.

### Details

- **Type:** `Binding<CGColor>`
- **Behavior:**
    - **Get:** Returns the `cgColor` property of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` using a new `CGColor`.
