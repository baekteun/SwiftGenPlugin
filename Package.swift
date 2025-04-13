// swift-tools-version: 5.6
import PackageDescription

let package = Package(
  name: "SwiftGenPlugin",
  products: [
    .plugin(name: "SwiftGenPlugin", targets: ["SwiftGenPlugin"]),
    .plugin(name: "SwiftGen-Generate", targets: ["SwiftGen-Generate"])
  ],
  dependencies: [],
  targets: [
    .plugin(
      name: "SwiftGenPlugin",
      capability: .buildTool(),
      dependencies: ["swiftgen"]
    ),
    .plugin(
      name: "SwiftGen-Generate",
      capability: .command(
        intent: .custom(
          verb: "generate-code-for-resources",
          description: "Creates type-safe for all your resources"
        ),
        permissions: [
          .writeToPackageDirectory(reason: "This command generates source code")
        ]
      ),
      dependencies: ["swiftgen"]
    ),
    .binaryTarget(
      name: "swiftgen",
      url: "https://github.com/baekteun/SwiftGen/releases/download/6.6.4/swiftgen-6.6.4.artifactbundle.zip",
      checksum: "08aacc29b328d20224b9fd2e4ae2de838592ebc766227c4702cbf9388ac5c588"
    )
  ]
)
