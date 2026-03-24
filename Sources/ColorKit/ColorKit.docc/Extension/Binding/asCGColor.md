Projects `Binding<CKColor>` to `Binding<CGColor>`.

## Overview

Use `asCGColor` to bridge a `CKColor` binding to a `CGColor` binding. Connect `CKColor` state to APIs requiring `Binding<CGColor>`, such as custom color pickers or low-level drawing utilities.

### Details

- **Type:** `Binding<CGColor>`
- **Behavior:**
    - **Get:** Returns the `cgColor` property of the wrapped `CKColor`.
    - **Set:** Updates the wrapped `CKColor` with the new `CGColor`.
