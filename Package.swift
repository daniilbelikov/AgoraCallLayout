// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "AgoraCallLayout",
    products: [
        .library(
            name: "AgoraCallLayout",
            targets: ["AgoraCallLayout"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AgoraCallLayout",
            dependencies: []),
        .testTarget(
            name: "AgoraCallLayoutTests",
            dependencies: ["AgoraCallLayout"]),
    ]
)
