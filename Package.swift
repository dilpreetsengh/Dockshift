// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Dockshift",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "Dockshift", targets: ["DockshiftApp"]),
        .library(name: "DockshiftCore", targets: ["DockshiftCore"]),
        .library(name: "Keyboard", targets: ["Keyboard"]),
        .library(name: "Mouse", targets: ["Mouse"]),
        .library(name: "Monitor", targets: ["Monitor"]),
        .library(name: "DockSetup", targets: ["DockSetup"])
    ],
    targets: [
        .executableTarget(
            name: "DockshiftApp",
            dependencies: ["DockshiftCore", "Keyboard", "Mouse", "Monitor", "DockSetup"],
            path: "Sources/DockshiftApp"
        ),
        .target(name: "DockshiftCore", path: "Sources/DockshiftCore"),
        .target(name: "Keyboard", dependencies: ["DockshiftCore"], path: "Sources/Keyboard"),
        .target(name: "Mouse", dependencies: ["DockshiftCore"], path: "Sources/Mouse"),
        .target(name: "Monitor", dependencies: ["DockshiftCore"], path: "Sources/Monitor"),
        .target(name: "DockSetup", dependencies: ["DockshiftCore"], path: "Sources/DockSetup")
    ]
)
