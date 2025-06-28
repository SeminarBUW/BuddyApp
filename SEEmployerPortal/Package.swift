// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SEEmployerPortal",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "SEEmployerPortal", targets: ["SEEmployerPortal"])
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../SETandemCore")
    ],
    targets: [
        .target(
            name: "SEEmployerPortal",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "SETandemCore", package: "SETandemCore")
            ],
            path: "Sources",
            linkerSettings: [.linkedFramework("PDFKit")]
        ),
        .testTarget(
            name: "SEEmployerPortalTests",
            dependencies: ["SEEmployerPortal"],
            path: "Tests"
        )
    ]
)
