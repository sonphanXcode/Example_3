import ProjectDescription

let project = Project(
    name: "Test3",
    targets: [
        .target(
            name: "Test3",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.Test3",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "Test3/Sources",
                "Test3/Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "Test3Tests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.Test3Tests",
            infoPlist: .default,
            buildableFolders: [
                "Test3/Tests"
            ],
            dependencies: [.target(name: "Test3")]
        ),
    ]
)
