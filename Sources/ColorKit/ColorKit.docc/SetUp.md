# Set Up

@Metadata {
    @SupportedLanguage(swift)
    @TitleHeading("Getting Started")
    @Available(iOS, introduced: "13.0")
    @Available(iPadOS, introduced: "13.0")
    @Available(macOS, introduced: "10.15")
    @Available(tvOS, introduced: "13.0")
    @Available(watchOS, introduced: "6.0")
    @Available(visionOS, introduced: "1.0")
    @Available(swift, introduced: "5.9")
    @Available(Xcode, introduced: "15.0")
    @PageColor(purple)
}

@Options {
    @AutomaticSeeAlso(disabled)
}

Integrate `ColorKit` into your Swift project.

## Overview

`ColorKit` provides a Swift API for color manipulation and conversion. Add it using Swift Package Manager (SPM).

## Installing Agent Skill

Install the ColorKit skill to get expert guidance in your terminal.

### Using skills.sh:
```bash
npx skills add https://github.com/SzpakKamil/AgentSkills --skill ColorKit
```

### Using ClawdHub:
```bash
npx dlx clawdhub@latest install colorkit
```

## Adding ColorKit

Add `ColorKit` via Swift Package Manager:

1. Go to **File > Add Package Dependency** in Xcode.
2. Enter the URL: `https://github.com/SzpakKamil/ColorKit.git`.
3. Select a version (e.g., `1.0.0` or later) or `main` and click **Add Package**.
4. Use Swift 5.9+ for compatibility.
5. Import the module:

   ```swift
   import ColorKit
   ```

See the [README](https://github.com/SzpakKamil/ColorKit) for details.

### Example Integration

Use `CKColor` in a SwiftUI view:

```swift
import SwiftUI
import ColorKit

struct ContentView: View {
    // Create color from Hex string
    let accent = CKColor(hexString: "#FF5733")
    
    var body: some View {
        VStack {
            Text("Advanced Color")
                .font(.largeTitle)
                .foregroundStyle(accent) // CKColor conforms to ShapeStyle
            
            RoundedRectangle(cornerRadius: 12)
                .fill(accent.blended(with: .black, mode: .multiply))
                .frame(width: 200, height: 100)
                .overlay(Text("Blended Color").colorInvert())
        }
        .padding()
    }
}
```

This example creates a color from a hex string and applies a blend mode.

## Troubleshooting

- **Package not found**: Check the URL (`https://github.com/SzpakKamil/ColorKit.git`) and internet connection.
- **Dependency issues**: Confirm the version exists. Try `main` if unsure.
- **Module not recognized**: Add the package to your target and `import ColorKit`.
- **Compatibility errors**: Ensure deployment targets meet iOS 13.0+, macOS 10.15+, tvOS 13.0+, watchOS 6.0+, or visionOS 1.0+.

## Next Steps

- <doc:ColorKit>
