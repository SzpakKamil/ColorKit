//
//  CKColor-Identifier.swift
//  ColorKit
//
//  Created by Kamil Szpak on 11/02/2026.
//

import Foundation

@_documentation(visibility: internal)
public extension CKColor{
    struct Identifier: Hashable, Sendable, Codable {
        let primary: UInt64
        let secondary: UInt64
        
        /// Generates a stable, collision-resistant hash based on the color definition state.
        static func generate(
            p: ColorDefinition, d: ColorDefinition?, hc: ColorDefinition?, hcd: ColorDefinition?,
            cs: CKColor.ColorSpace
        ) -> Identifier {
            var hasher = Hasher()
            hasher.combine(p.id)
            hasher.combine(d?.id)
            hasher.combine(hc?.id)
            hasher.combine(hcd?.id)
            hasher.combine(cs.rawValue)
            let h1 = UInt64(bitPattern: Int64(hasher.finalize()))
            
            var mixer = Hasher()
            mixer.combine(cs.rawValue)
            mixer.combine(p.id)
            let h2 = UInt64(bitPattern: Int64(mixer.finalize()))
            
            return Identifier(primary: h1, secondary: h2)
        }
    }
}
