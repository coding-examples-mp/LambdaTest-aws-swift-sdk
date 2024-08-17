// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let xName = "LambdaTest"

let package = Package(
    name: xName,
    platforms: [
        .macOS(.v10_15),
        .iOS(.v14),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
        .package(url: "https://github.com/awslabs/aws-sdk-swift.git", from: "0.16.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: xName,
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "AWSLambda", package: "aws-sdk-swift")
            ],
            swiftSettings: [
                .unsafeFlags([
                    "-parse-as-library"
                ])
            ]
        ),
    ]
)
