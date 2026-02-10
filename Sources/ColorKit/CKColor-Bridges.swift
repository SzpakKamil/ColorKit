//
//  CKColor-Bridges.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import SwiftUI

#if canImport(CoreImage)
  import CoreImage
#endif
#if canImport(UIKit)
  import UIKit
#elseif canImport(AppKit)
  import AppKit
#endif

// MARK: - Native Color Extensions
extension NativeColor {
  public var ckColor: CKColor { CKColor(nativeColor: self) }
}
extension Color {
  @available(iOS 14.0, watchOS 7.0, macOS 11.0, tvOS 14.0, *)
  public var ckColor: CKColor { CKColor(nativeColor: NativeColor(self)) }
}

#if canImport(CoreImage)
  extension CIColor {
    public var ckColor: CKColor { CKColor(nativeColor: NativeColor(ciColor: self)) }
  }
#endif

extension CGColor {
  #if canImport(AppKit)
    public var ckColor: CKColor { CKColor(nativeColor: NativeColor(cgColor: self) ?? .black) }
  #else
    public var ckColor: CKColor { CKColor(nativeColor: NativeColor(cgColor: self)) }
  #endif

}
// MARK: - Conditional ShapeStyle Conformance
#if canImport(SwiftUI)
  @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
  extension CKColor: ShapeStyle {
    public func resolve(in proxy: EnvironmentValues) -> Color {
      self.color
    }
  }
#endif
