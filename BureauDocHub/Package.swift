// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BureauDocHub",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "BureauDocHub", targets: ["BureauDocHub"])
    ],
    dependencies: [
        .package(path: "../DesignSystem")
    ],
    targets: [
        .target(
            name: "BureauDocHub",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem")
            ],
            path: "Sources",
            linkerSettings: [.linkedFramework("PDFKit")]
        ),
        .testTarget(
            name: "BureauDocHubTests",
            dependencies: ["BureauDocHub"],
            path: "Tests"
        )
    ]
)
