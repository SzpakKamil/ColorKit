# ``SwiftUICore/Binding``

@Metadata {
    @TitleHeading("SwiftUI Extensions")
    @DisplayName("Binding", style: symbol)
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

Projects and bridges for SwiftUI bindings.

## Overview

ColorKit extends `Binding` when the wrapped value is a ``ColorKit/CKColor``. These extensions bridge `CKColor` to other color types, including SwiftUI `Color`, `CGColor`, `CIColor`, and platform-native colors (`UIColor`/`NSColor`).

Use these bridges to maintain `CKColor` as the source of truth while interacting with standard SwiftUI views like `ColorPicker` or low-level framework components.

## Topics

### Color Projections
- ``asColor``
- ``asCGColor``
- ``asCIColor``
- ``asNativeColor``
