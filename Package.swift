// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "distribution",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "distribution",
            targets: ["distribution"])
    ],
    targets: [
        .binaryTarget(
            name: "distribution",
            path: "distribution.xcframework"
        )
    ]
)
