// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "IntegrationPlusApp",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "IntegrationPlusApp",
            targets: ["IntegrationPlusApp"]
        )
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../AppShell")
    ],
    targets: [
        .target(
            name: "IntegrationPlusApp",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "AppShell", package: "AppShell")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "IntegrationPlusAppTests",
            dependencies: ["IntegrationPlusApp"],
            path: "Tests"
        )
    ]
)
