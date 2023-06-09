// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "Libs",
        platforms: [
            .iOS(.v13)
        ],
        products: [
            // Products define the executables and libraries a package produces, and make them visible to other packages.
            .library(
                    name: "Libs",
                    type: .dynamic,
                    targets: ["Libs"]),
        ],
        dependencies: [
            .package(url: "https://github.com/SwiftKickMobile/SwiftMessages", .upToNextMajor(from: "9.0.6")),
            .package(url: "https://github.com/Open-Bytes/SwiftUINavigator", .upToNextMajor(from: "1.0.4")),
            .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
            .package(url: "https://github.com/hackiftekhar/IQKeyboardManager.git", from: "6.5.0"),
            .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0")),
            .package(url: "https://github.com/hyperoslo/Cache.git", .upToNextMajor(from: "6.0.0")),
        ],
        targets: [
            // Targets are the basic building blocks of a package. A target can define a module or a test suite.
            // Targets can depend on other targets in this package, and on products in packages this package depends on.
            .target(
                    name: "Libs",
                    dependencies: [
                        .product(name: "CombineMoya", package: "Moya"),
                        .product(name: "IQKeyboardManagerSwift", package: "IQKeyboardManager"),
                        "SwiftMessages",
                        "SwiftUINavigator",
                        "Kingfisher",
                        "Cache",
                    ]),
            .testTarget(
                    name: "LibsTests",
                    dependencies: ["Libs"]),
        ]
)
