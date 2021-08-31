// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "0.8.0"
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
            url: "https://github.com/ybrid/opus-swift/releases/download/"+version+"/YbridOpus.xcframework.zip",
            checksum: "18ea18853b9fab16d0393d39e62c26fd6fbdbba8224345bd3ecbc45540c8aa18"
            )
    ]
)
