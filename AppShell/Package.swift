// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppShell",
    products: [
        .library(name: "AppShell", targets: ["AppShell"])
    ],
    targets: [
        .target(name: "AppShell", path: "Sources"),
        .testTarget(
            name: "AppShellTests",
            dependencies: ["AppShell"],
            path: "Tests"
        )
    ]
)
