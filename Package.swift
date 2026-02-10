// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ColorKit",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .visionOS(.v1)
    ],
    products: [
        .library(
            name: "ColorKit",
            targets: ["ColorKit"]),
    ],
    targets: [
        .target(
            name: "ColorKit",
            resources: [
                .process("Resources/Localizable.xcstrings"),
            ]
               ),
        .testTarget(
            name: "ColorKitTests",
            dependencies: ["ColorKit"]
        )
    ]
)
