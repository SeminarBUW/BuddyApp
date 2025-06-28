// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BureauProgress",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "BureauProgress",
            targets: ["BureauProgress"]),
    ],
    dependencies: [
        .package(path: "../DesignSystem")
    ],
    targets: [
        .target(
            name: "BureauProgress",
            dependencies: ["DesignSystem"],
            swiftSettings: [
                .define("WIDGETS")
            ]
        ),
        .testTarget(
            name: "BureauProgressTests",
            dependencies: ["BureauProgress"]
        )
    ]
)
