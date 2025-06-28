// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DesignSystem",
    products: [
        .library(name: "DesignSystem", targets: ["DesignSystem"])
    ],
    targets: [
        .target(name: "DesignSystem", path: "Sources"),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"],
            path: "Tests"
        )
    ]
)
