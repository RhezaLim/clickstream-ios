// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Clickstream",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "Clickstream", targets: ["Clickstream"]),
        .library(name: "ClickstreamTracker", targets: ["Clickstream"]),
        .library(name: "ClickstreamEventVisualizer", targets: ["Clickstream"]),
        .library(name: "ClickstreamETETestSuite", targets: ["Clickstream"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.30.0"),
        .package(url: "https://github.com/ashleymills/Reachability.swift.git", from: "5.0.0"),
        .package(url: "https://github.com/groue/GRDB.swift.git", from: "6.7.0"),
        .package(url: "https://github.com/daltoniam/Starscream.git", exact: "4.0.5")
    ],
    targets: [
        .target(
            name: "Clickstream",
            dependencies: [
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "Reachability", package: "Reachability.swift"),
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "Starscream", package: "Starscream")
            ],
            path: "Sources",
            resources: [
                .process("EventVisualizer/Resources"),
            ],
            swiftSettings: [
                .define("TRACKER_ENABLED"),
                .define("EVENT_VISUALIZER_ENABLED"),
                .define("ETE_TEST_SUITE_ENABLED"),
            ],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("CoreTelephony"),
            ]
        ),
    ]
)
