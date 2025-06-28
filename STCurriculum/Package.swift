// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "STCurriculum",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "STCurriculum", targets: ["STCurriculum"])
    ],
    dependencies: [
        .package(path: "../DesignSystem")
    ],
    targets: [
        .target(
            name: "STCurriculum",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "STCurriculumTests",
            dependencies: ["STCurriculum"],
            path: "Tests"
        )
    ]
)
