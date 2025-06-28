// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SEAgencyAdmin",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "SEAgencyAdmin", targets: ["SEAgencyAdmin"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../SETandemCore"),
        .package(url: "https://github.com/apple/swift-charts", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "SEAgencyAdmin",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "SETandemCore", package: "SETandemCore"),
                .product(name: "Charts", package: "swift-charts")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "SEAgencyAdminTests",
            dependencies: ["SEAgencyAdmin"],
            path: "Tests"
        )
    ]
)
