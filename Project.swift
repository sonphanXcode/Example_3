import ProjectDescription

private let bundleId: String = "dev.son7.ios.ptest3"
private let version: String = "0.0.1"
private let bundleVersion: String = "1"
private let iOSTargetVersion: String = "16.0"

private let basePath: String = "Test3"
private let appName = "Test3"

let project = Project(name: appName,
                      packages: [],
                      settings: Settings.settings(configurations: makeConfigurations()),
                      targets: [
                        .target(name: "iOS",
                                destinations: [.iPhone],
                                product: .app,
                                bundleId: bundleId,
                                deploymentTargets: .iOS(iOSTargetVersion),
                                infoPlist: makeInfoPlist(),
                                sources: ["\(basePath)/Sources/**"],
                                resources: ["\(basePath)/Resources/**"],
                                settings: baseSettings()
                               )
                      ],
                      additionalFiles: [
                        "README.md",
                      ])


private func makeConfigurations() -> [Configuration] {
    let debug: Configuration = Configuration.debug(name: "Debug", xcconfig: "Configs/Debug.xcconfig")
    let release: Configuration = Configuration.release(name: "Release", xcconfig: "Configs/Release.xcconfig")
    
    return [debug, release]
}

private func makeInfoPlist(merging other: [String : Plist.Value] = [:]) -> InfoPlist {
    var extendedPlist: [String : Plist.Value] = [:]
    extendedPlist = ["UIApplicationSceneManifest": .dictionary(["UIApplicationSupportsMultipleScenes": .boolean(true)]),
                     "UILaunchScreen": .array([]),
                     "UISupportedInterfaceOrientations": .array([.string("UIInterfaceOrientationPortrait")]),
                     "CFBundleShortVersionString": .string(version),
                     "CFBundleVersion": .string(bundleVersion),
                     "CFBundleDisplayName": .string("$(APP_DISPLAY_NAME)")
                    ]
    other.forEach { (key: String, value: Plist.Value) in
        extendedPlist[key] = value
    }
    return .extendingDefault(with: extendedPlist)
}

private func baseSettings() -> Settings {
    let settings = SettingsDictionary()
    return Settings.settings(base: settings,
                             configurations: [],
                             defaultSettings: .recommended)
}
