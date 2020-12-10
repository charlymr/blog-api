// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "blog-api-module",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "BlogApiModule", targets: ["BlogApiModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/binarybirds/feather-core", from: "1.0.0-beta"),
        .package(name: "blog-module", url: "https://github.com/charlymr/blog", from: "1.0.0-beta.10"),
    ],
    targets: [
        .target(name: "BlogApiModule", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            .product(name: "BlogModule", package: "blog-module"),
        ]),
        .testTarget(name: "BlogApiModuleTests", dependencies: [
                .target(name: "BlogApiModule"),
            ])
    ]
)
