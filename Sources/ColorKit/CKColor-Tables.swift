//
//  CKColor-Tables.swift
//  ColorKit
//
//  Created by Kamil Szpak on 09/02/2026.
//

import Foundation
import SwiftUI

#if canImport(UIKit)
  import UIKit
#elseif canImport(AppKit)
  import AppKit
#endif

extension CKColor {
  // MARK: - Default Colors
  public static let red = CKColor(id: "red") ?? .init(red: 1, green: 0, blue: 0)
  public static let orange = CKColor(id: "orange") ?? .init(red: 1, green: 0.5, blue: 0)
  public static let yellow = CKColor(id: "yellow") ?? .init(red: 1, green: 1, blue: 0)
  public static let green = CKColor(id: "green") ?? .init(red: 0, green: 1, blue: 0)
  public static let mint = CKColor(id: "mint") ?? .init(red: 0, green: 1, blue: 1)
  public static let teal = CKColor(id: "teal") ?? .init(red: 0, green: 0.5, blue: 0.5)
  public static let cyan = CKColor(id: "cyan") ?? .init(red: 0, green: 1, blue: 1)
  public static let blue = CKColor(id: "blue") ?? .init(red: 0, green: 0, blue: 1)
  public static let indigo = CKColor(id: "indigo") ?? .init(red: 0.3, green: 0, blue: 0.5)
  public static let purple = CKColor(id: "purple") ?? .init(red: 0.5, green: 0, blue: 0.5)
  public static let pink = CKColor(id: "pink") ?? .init(red: 1, green: 0, blue: 0.5)
  public static let brown = CKColor(id: "brown") ?? .init(red: 0.6, green: 0.4, blue: 0.2)
  public static let gray = CKColor(id: "gray") ?? .init(red: 0.5, green: 0.5, blue: 0.5)
  public static let white = CKColor(id: "white") ?? .init(red: 1, green: 1, blue: 1)
  public static let black = CKColor(id: "black") ?? .init(red: 0, green: 0, blue: 0)

  public static let standardColors: [CKColor] = [
    .red, .orange, .yellow, .green, .mint, .teal, .cyan, .blue,
    .indigo, .purple, .pink, .brown, .gray, .white, .black,
  ]

  // MARK: - Registry

  struct StandardColorMetadata: Sendable {
    let native: NativeColor
    let localizedKey: String
    let fallbackName: String
    let components: RGBA
  }

  static let registry: [String: StandardColorMetadata] = {
    let resolve: (String, (Double, Double, Double, Double)) -> NativeColor = { name, fallback in
      #if canImport(UIKit)
        #if os(watchOS)
          // watchOS has a very limited set of system colors in UIColor.
          switch name {
          case "red": return .red
          case "orange": return .orange
          case "yellow": return .yellow
          case "green": return .green
          case "blue": return .blue
          case "purple": return .purple
          case "gray": return .gray
          case "white": return .white
          case "black": return .black
          case "cyan": return .cyan
          case "brown":
            if #available(watchOS 10.0, *) {
              return .brown
            } else {
              return .init(red: fallback.0, green: fallback.1, blue: fallback.2, alpha: fallback.3)
            }
          // Indigo, Mint, Pink are not available as static properties on watchOS UIColor
          default:
            return .init(red: fallback.0, green: fallback.1, blue: fallback.2, alpha: fallback.3)
          }
        #else
          // iOS / tvOS
          switch name {
          case "red": return .systemRed
          case "orange": return .systemOrange
          case "yellow": return .systemYellow
          case "green": return .systemGreen
          case "mint":
            if #available(iOS 15.0, tvOS 15.0, *) {
              return .systemMint
            } else {
              return .systemGreen
            }
          case "teal": return .systemTeal
          case "cyan":
            if #available(iOS 15.0, tvOS 15.0, *) { return .systemCyan } else { return .cyan }
          case "blue": return .systemBlue
          case "indigo":
            if #available(iOS 15.0, tvOS 15.0, *) {
              return .systemIndigo
            } else {
              return .systemBlue
            }
          case "purple": return .systemPurple
          case "pink":
            if #available(iOS 15.0, tvOS 15.0, *) { return .systemPink } else { return .systemRed }
          case "brown": return .systemBrown
          case "gray": return .systemGray
          case "white": return .white
          case "black": return .black
          default:
            return .init(red: fallback.0, green: fallback.1, blue: fallback.2, alpha: fallback.3)
          }
        #endif
      #elseif canImport(AppKit)
        // macOS
        switch name {
        case "red": return .systemRed
        case "orange": return .systemOrange
        case "yellow": return .systemYellow
        case "green": return .systemGreen
        case "mint":
          if #available(macOS 12.0, *) { return .systemMint } else { return .systemGreen }
        case "teal": return .systemTeal
        case "cyan": if #available(macOS 12.0, *) { return .systemCyan } else { return .cyan }
        case "blue": return .systemBlue
        case "indigo":
          if #available(macOS 12.0, *) { return .systemIndigo } else { return .systemBlue }
        case "purple": return .systemPurple
        case "pink": if #available(macOS 12.0, *) { return .systemPink } else { return .systemRed }
        case "brown": return .systemBrown
        case "gray": return .systemGray
        case "white": return .white
        case "black": return .black
        default:
          return .init(red: fallback.0, green: fallback.1, blue: fallback.2, alpha: fallback.3)
        }
      #else
        return .init(red: fallback.0, green: fallback.1, blue: fallback.2, alpha: fallback.3)
      #endif
    }

    let colors: [(String, (Double, Double, Double, Double), String, String)] = [
      ("red", (1, 0, 0, 1), "ColorKit.Red", "Red"),
      ("orange", (1, 0.5, 0, 1), "ColorKit.Orange", "Orange"),
      ("yellow", (1, 1, 0, 1), "ColorKit.Yellow", "Yellow"),
      ("green", (0, 1, 0, 1), "ColorKit.Green", "Green"),
      ("mint", (0, 1, 1, 1), "ColorKit.Mint", "Mint"),
      ("teal", (0, 0.5, 0.5, 1), "ColorKit.Teal", "Teal"),
      ("cyan", (0, 1, 1, 1), "ColorKit.Cyan", "Cyan"),
      ("blue", (0, 0, 1, 1), "ColorKit.Blue", "Blue"),
      ("indigo", (0.3, 0, 0.5, 1), "ColorKit.Indigo", "Indigo"),
      ("purple", (0.5, 0, 0.5, 1), "ColorKit.Purple", "Purple"),
      ("pink", (1, 0, 0.5, 1), "ColorKit.Pink", "Pink"),
      ("brown", (0.6, 0.4, 0.2, 1), "ColorKit.Brown", "Brown"),
      ("gray", (0.5, 0.5, 0.5, 1), "ColorKit.Gray", "Gray"),
      ("white", (1, 1, 1, 1), "ColorKit.White", "White"),
      ("black", (0, 0, 0, 1), "ColorKit.Black", "Black"),
    ]

    var dict = [String: StandardColorMetadata]()
    for (key, fallback, loc, label) in colors {
      let native = resolve(key, fallback)
      let rgba =
        CKColor.Converter(color: native, in: .sRGB)?.rgba
        ?? RGBA(r: fallback.0, g: fallback.1, b: fallback.2, a: fallback.3)
      dict[key] = StandardColorMetadata(
        native: native, localizedKey: loc, fallbackName: label, components: rgba)
    }
    return dict
  }()

  static let hexRegistry: [String: String] = {
    var dict = [String: String]()
    for (key, metadata) in registry {
      #if canImport(UIKit)
        #if os(watchOS)
          // watchOS does not support trait-based color resolution.
          if let hex = CKColor.Converter(color: metadata.native, in: .sRGB)?.hex {
            dict[hex] = key
          }
        #else
          let lightTraits = UITraitCollection(userInterfaceStyle: .light)
          let darkTraits = UITraitCollection(userInterfaceStyle: .dark)

          let hcTraits: UITraitCollection
          let hcDarkTraits: UITraitCollection
          if #available(iOS 17.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *) {
            hcTraits = UITraitCollection(userInterfaceStyle: .light).modifyingTraits { traits in
              traits.accessibilityContrast = .high
            }
            hcDarkTraits = UITraitCollection(userInterfaceStyle: .dark).modifyingTraits { traits in
              traits.accessibilityContrast = .high
            }
          } else {
            hcTraits = UITraitCollection(traitsFrom: [
              .init(userInterfaceStyle: .light), .init(accessibilityContrast: .high),
            ])
            hcDarkTraits = UITraitCollection(traitsFrom: [
              .init(userInterfaceStyle: .dark), .init(accessibilityContrast: .high),
            ])
          }

          let traits: [UITraitCollection] = [
            lightTraits,
            darkTraits,
            hcTraits,
            hcDarkTraits,
          ]

          for trait in traits {
            let resolved = metadata.native.resolvedColor(with: trait)
            if let hex = CKColor.Converter(color: resolved, in: .sRGB)?.hex {
              dict[hex] = key
            }
          }
        #endif
      #elseif canImport(AppKit)
        let appearanceNames: [NSAppearance.Name] = [
          .aqua, .darkAqua, .accessibilityHighContrastAqua, .accessibilityHighContrastDarkAqua,
        ]

        for name in appearanceNames {
          if let appearance = NSAppearance(named: name) {
            var hex: String?
            if #available(macOS 11.0, *) {
              appearance.performAsCurrentDrawingAppearance {
                hex = CKColor.Converter(color: metadata.native, in: .sRGB)?.hex
              }
            } else {
              let saved = NSAppearance.current
              NSAppearance.current = appearance
              hex = CKColor.Converter(color: metadata.native, in: .sRGB)?.hex
              NSAppearance.current = saved
            }
            if let hex = hex {
              dict[hex] = key
            }
          }
        }
      #else
        let hex = CKColor.Converter(
          red: metadata.components.r, green: metadata.components.g, blue: metadata.components.b,
          alpha: metadata.components.a
        ).hex
        dict[hex] = key
      #endif
    }
    return dict
  }()

  static func isStandardName(_ name: String) -> Bool {
    return registry[name.lowercased()] != nil
  }
}
