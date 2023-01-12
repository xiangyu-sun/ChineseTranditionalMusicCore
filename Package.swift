// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChineseTranditionalMusicCore",
    platforms: [
            .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ChineseTranditionalMusicCore",
            targets: ["ChineseTranditionalMusicCore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
      .package(url: "git@github.com:xiangyu-sun/ChineseAstrologyCalendar.git", .branchItem("master")),
      .package(url: "https://github.com/airbnb/swift", from: "1.0.0"),
      .package(url: "https://github.com/xiangyu-sun/MusicTheory", .branchItem("master"))
      
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ChineseTranditionalMusicCore",
            dependencies: [
              .product(name: "ChineseAstrologyCalendar", package: "ChineseAstrologyCalendar"),
              .product(name: "MusicTheory", package: "MusicTheory")
            ]),
        .testTarget(
            name: "ChineseTranditionalMusicCoreTests",
            dependencies: ["ChineseTranditionalMusicCore"]),
    ]
)
