// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "BobIOS",
    products: [
        .library(
            name: "BobIOS",
            targets: ["BobIOS"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", .upToNextMajor(from: "1.1.4")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.0"))
    ],
    targets: [
        .target(
            name: "BobIOS",
            dependencies: ["CombineMoya"])
    ]
)
