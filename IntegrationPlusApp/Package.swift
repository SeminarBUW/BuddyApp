// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "IntegrationPlusApp",
    platforms: [.iOS(.v15)],
    products: [
        .iOSApplication(
            name: "IntegrationPlusApp",
            targets: ["IntegrationPlusApp"],
            bundleIdentifier: "com.example.integrationplus",
            teamIdentifier: "", 
            displayVersion: "1.0",
            bundleVersion: "1",
            supportedDeviceFamilies: [.pad, .phone],
            supportedInterfaceOrientations: [
                .portrait, .landscapeLeft, .landscapeRight
            ]
        )
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../AppShell")
    ],
    targets: [
        .executableTarget(
            name: "IntegrationPlusApp",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "AppShell", package: "AppShell")
            ],
            path: "Sources"
        )
    ]
)