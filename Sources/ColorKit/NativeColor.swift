//
//  Typealias.swift
//  ColorKit
//
//  Created by Kamil Szpak on 11/02/2026.
//


#if canImport(UIKit)
    import UIKit
    @_documentation(visibility: internal)
    public typealias NativeColor = UIColor
#elseif canImport(AppKit)
    import AppKit
    @_documentation(visibility: internal)
    public typealias NativeColor = NSColor
#endif
