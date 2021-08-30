// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "0.7.1"
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
            checksum: "84f8040dcf74b5e493b002b122d59e4614c43d3185b65a3de2e8b9b7dd784868"
            )
    ]
)
