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
