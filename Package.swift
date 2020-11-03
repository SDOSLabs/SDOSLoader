// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SDOSLoader",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "SDOSLoader",
            targets: ["SDOSLoader"])
    ],
    dependencies: [
        .package(url: "https://github.com/SDOSLabs/SDOSCustomLoader.git", .branch("feature/spm")),
        .package(url: "https://github.com/SDOSLabs/SDOSSwiftExtension.git", .branch("feature/spm")),
        
        .package(url: "https://github.com/SDOSLabs/DGActivityIndicatorView.git", .upToNextMajor(from: "2.2.0")),
        .package(url: "https://github.com/SDOSLabs/M13ProgressSuite.git", .upToNextMajor(from: "1.3.0")),
        .package(url: "https://github.com/jdg/MBProgressHUD.git", .upToNextMajor(from: "1.2.0")),
    ],
    targets: [
        .target(
            name: "SDOSLoader",
            dependencies: [
                "DGActivityIndicatorView",
                "SDOSCustomLoader",
                "M13ProgressSuite",
                "MBProgressHUD",
                "SDOSSwiftExtension"
            ],
            path: "src"
        ),
    ]
)
