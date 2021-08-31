// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YbridOpus",
    platforms: [
        .macOS(.v10_10), .iOS(.v9)
    ],
    products: [
        .library(
            name: "YbridOpus",
            targets: ["YbridOpus"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "YbridOpus", 
            url: "https://github.com/ybrid/opus-swift/releases/download/0.8.0/YbridOpus.xcframework.zip",
            checksum: "66fc6c6798f19db7cc6ddf5ccef8760a7bf9e068d72f16165da2326e8ae80829"
            )
    ]
)
