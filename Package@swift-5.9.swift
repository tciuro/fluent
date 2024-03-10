// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "fluent",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "Fluent", targets: ["Fluent"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tciuro/fluent-kit", branch: "main"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.91.1"),
    ],
    targets: [
        .target(
            name: "Fluent",
            dependencies: [
                .product(name: "FluentKit", package: "fluent-kit"),
                .product(name: "Vapor", package: "vapor"),
            ],
            swiftSettings: [
                .enableUpcomingFeature("ExistentialAny"),
                .enableExperimentalFeature("StrictConcurrency=complete"),
            ]
        ),
        .testTarget(
            name: "FluentTests",
            dependencies: [
                .target(name: "Fluent"),
                .product(name: "XCTFluent", package: "fluent-kit"),
                .product(name: "XCTVapor", package: "vapor"),
            ],
            swiftSettings: [
                .enableUpcomingFeature("ExistentialAny"),
                .enableExperimentalFeature("StrictConcurrency=complete"),
            ]
        ),
    ]
)
