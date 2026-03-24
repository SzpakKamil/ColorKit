Projects `Binding<CKColor>` to `Binding<CIColor>`.

## Overview

Use `asCIColor` to bridge a `CKColor` binding to a `CIColor` binding. Drive Core Image filter parameters directly from `CKColor` state.

### Details

- **Type:** `Binding<CIColor>`
- **Availability:** Platforms supporting Core Image.
- **Behavior:**
    - **Get:** Returns the `ciColor` property of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` with the new `CIColor`.
