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

Learn how to integrate the `ColorKit` package into your Swift project.

## Overview

The `ColorKit` package provides a powerful, cross-platform Swift API for advanced color manipulation and conversion. This guide explains how to add the package using Swift Package Manager (SPM).

## Installing Agent Skill
You can install the ColorKit skill for your CLI agent to get expert guidance on color manipulation and conversion directly in your terminal.

### Using skills.sh:
```bash
npx skills add https://github.com/SzpakKamil/AgentSkills --skill ColorKit
```

### Using ClawdHub:
```bash
npx dlx clawdhub@latest install colorkit
```

## Adding ColorKit to Your Project

Add the `ColorKit` package to your project via Swift Package Manager:

1. In Xcode, go to **File > Add Package Dependency**.
2. Enter the package URL: `https://github.com/SzpakKamil/ColorKit.git`.
3. Select a version (e.g., `1.0.0` or later) or use the `main` branch, then click **Add Package**.
4. Ensure your project uses Swift 5.9+ for compatibility.
5. Import the module in your Swift file:

   ```swift
   import ColorKit
   ```

For detailed instructions and contribution guidelines, see the README at https://github.com/SzpakKamil/ColorKit.

### Example Integration

Here’s a minimal example of using `CKColor` in a SwiftUI view:

```swift
import SwiftUI
import ColorKit

struct ContentView: View {
    // Create a color from a Hex string
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

This example demonstrates creating a color from a hex string and applying a blend mode, showcasing how `CKColor` integrates directly with SwiftUI's `ShapeStyle`.

## Troubleshooting

- **Package not found**: Verify the URL (`https://github.com/SzpakKamil/ColorKit.git`) and your internet connection.
- **Dependency issues**: Confirm the version or branch exists in the repository. Try the `main` branch if unsure.
- **Module not recognized**: Ensure the package is added to your project’s target and `import ColorKit` is included.
- **Compatibility errors**: Check that your project’s deployment target meets iOS 13.0+, macOS 10.15+, tvOS 13.0+, watchOS 6.0+, or visionOS 1.0+.

## Next Steps

- Explore the main API reference in <doc:ColorKit>.
