#if compiler(>=6.0)
//
//  CKColor-Concurrency-Tests.swift
//  ColorKit
//
//  Created by Kamil Szpak on 10/02/2026.
//

import SwiftUI
import Testing

@testable import ColorKit

@Suite("Concurrency & Thread Safety")
struct CKColorConcurrencyTests {

  @Test("Concurrent Bridge Stress Test")
  func testConcurrentBridgeAccess() async {
    // We create a pool of diverse colors to ensure we are hitting
    // different parts of the registry and hex lookup logic simultaneously.
    #if os(watchOS)
      let sourceColors: [NativeColor] = [
        .red, .blue, .green, .purple,
        NativeColor(displayP3Red: 1, green: 0.5, blue: 0, alpha: 1),
      ]
    #else
      let sourceColors: [NativeColor] = [
        .red, .blue, .green, .systemPink, .systemIndigo,
        NativeColor(displayP3Red: 1, green: 0.5, blue: 0, alpha: 1),
      ]
    #endif

    // Use a TaskGroup to spawn multiple concurrent child tasks
    await withTaskGroup(of: Void.self) { group in
      for i in 0..<100 {  // 100 concurrent bridge operations
        let colorToBridge = sourceColors[i % sourceColors.count]

        group.addTask {
          // This is the 'Hammer': multiple threads calling ckColor
          // which accesses the static 'registry' in CKColor-Tables.swift
          let ck = colorToBridge.ckColor

          // Verify integrity remains intact during the race
          #expect(ck.rgbComponents().a == 1.0)

          // Force a secondary lookup to check the hexRegistry
          let hex = ck.hexString
          #expect(hex.hasPrefix("#"))
        }
      }
    }
    // If the test completes without a crash (EXC_BAD_ACCESS),
    // the read-only registry is thread-safe.
  }
}

#endif
