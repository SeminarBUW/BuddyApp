// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SETandemCore",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "SETandemCore", targets: ["SETandemCore"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../STGamification")
    ],
    targets: [
        .target(
            name: "SETandemCore",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "STGamification", package: "STGamification")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "SETandemCoreTests",
            dependencies: ["SETandemCore"],
            path: "Tests"
        )
    ]
)
