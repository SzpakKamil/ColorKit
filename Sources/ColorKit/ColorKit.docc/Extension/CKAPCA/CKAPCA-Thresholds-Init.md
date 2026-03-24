Creates a custom accessibility threshold lookup table.

## Overview

Define custom logic for determining accessibility compliance.

### Parameters

- `lookup`: Closure taking font `size` (Double) and ``ColorKit/CKColor/FontWeight``, returning the minimum required `Lc` value.
