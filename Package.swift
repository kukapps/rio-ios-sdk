// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Rio",
    platforms: [.macOS(.v10_15),
                .iOS(.v12),
                .tvOS(.v13),
                .watchOS(.v7)],
    products: [
        .library(name: "Rio", targets: ["Rio"])
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "14.0.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.0")),
        .package(name: "KeychainSwift", url: "https://github.com/evgenyneu/keychain-swift.git", .upToNextMajor(from: "22.0.0")),
        .package(name: "JWTDecode", url: "https://github.com/auth0/JWTDecode.swift.git", .upToNextMajor(from: "2.6.0")),
        .package(
            name: "Firebase",
            url: "https://github.com/firebase/firebase-ios-sdk.git",
            .upToNextMajor(from: "10.29.0")
        )
    ],
    targets: [
        .target(name: "Rio", dependencies: [
            "Moya", "Alamofire", "KeychainSwift", "JWTDecode",
            .product(name: "FirebaseAuth", package: "Firebase"),
            .product(name: "FirebaseFirestore", package: "Firebase")
            
        ], path: "Rio/Classes")
    ]
)

