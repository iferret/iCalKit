// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iCalKit",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "iCalKit",
                 targets: ["iCalKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "libical",
                publicHeadersPath: "public",
                cSettings: [
                    .define("HAVE_CONFIG_H"),
                    .define("_GNU_SOURCE", .when(platforms: [Platform.linux])),
                    .define("HAVE_ENDIAN_H", .when(platforms: [Platform.linux])),
                    .define("HAVE_BYTESWAP_H", .when(platforms: [Platform.linux])),
                    .define("PACKAGE_DATA_DIR=\"/tmp/zoneinfo\""),
                    .headerSearchPath("include")
                ]),
        .target(name: "iCalKit",
                dependencies: ["libical"],
                resources: [.copy("../zoneinfo")]),
        .testTarget(name: "iCalKitTests",
                    dependencies: ["iCalKit"]),
    ]
)
