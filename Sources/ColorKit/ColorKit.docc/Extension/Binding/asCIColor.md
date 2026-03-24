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

Projects `Binding<CKColor>` to `Binding<CIColor>`.

## Overview

Use `asCIColor` to bridge a `CKColor` binding to a `CIColor` binding. Drive Core Image filter parameters directly from `CKColor` state.

### Details

- **Type:** `Binding<CIColor>`
- **Availability:** Platforms supporting Core Image.
- **Behavior:**
    - **Get:** Returns the `ciColor` property of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` with the new `CIColor`.
