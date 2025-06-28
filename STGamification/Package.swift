// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "STGamification",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "STGamification", targets: ["STGamification"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../STCurriculum")
    ],
    targets: [
        .target(
            name: "STGamification",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "STCurriculum", package: "STCurriculum")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "STGamificationTests",
            dependencies: ["STGamification"],
            path: "Tests"
        )
    ]
)
