import Darwin
import Foundation
import FlutterMacOS

final class LaunchAtStartupChannel {
  static let shared = LaunchAtStartupChannel()

  private let channelName = "launch_at_startup"
  private let launchAgentLabel: String
  private let launchAgentURL: URL
  private let fileManager = FileManager.default
  private let userIdentifier: uid_t = getuid()
  private var methodChannel: FlutterMethodChannel?

  private init() {
    let bundleIdentifier = Bundle.main.bundleIdentifier ?? "com.follow.zhuque"
    launchAgentLabel = "\(bundleIdentifier).autolaunch"

    let launchAgentDirectory = ("~/Library/LaunchAgents" as NSString).expandingTildeInPath
    launchAgentURL = URL(fileURLWithPath: launchAgentDirectory)
      .appendingPathComponent("\(launchAgentLabel).plist")
  }

  func register(with messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: channelName, binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      self?.handle(call: call, result: result)
    }
    methodChannel = channel
  }

  private func handle(call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "launchAtStartupIsEnabled":
      result(isLaunchAgentEnabled())
    case "launchAtStartupSetEnabled":
      guard
        let arguments = call.arguments as? [String: Any],
        let enabled = arguments["setEnabledValue"] as? Bool
      else {
        result(FlutterError(
          code: "invalid_arguments",
          message: "launchAtStartupSetEnabled expects a bool setEnabledValue.",
          details: nil
        ))
        return
      }
      if enabled {
        enableLaunchAgent(result: result)
      } else {
        disableLaunchAgent(result: result)
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func isLaunchAgentEnabled() -> Bool {
    guard
      let data = try? Data(contentsOf: launchAgentURL),
      let plist = try? PropertyListSerialization.propertyList(
        from: data,
        options: [],
        format: nil
      ) as? [String: Any],
      let label = plist["Label"] as? String,
      label == launchAgentLabel
    else {
      return false
    }
    return true
  }

  private func enableLaunchAgent(result: @escaping FlutterResult) {
    do {
      try ensureLaunchAgentDirectory()
      let plist = try createLaunchAgentPlist()
      guard plist.write(to: launchAgentURL, atomically: true) else {
        throw NSError(
          domain: "launch_at_startup",
          code: 2,
          userInfo: [NSLocalizedDescriptionKey: "Failed to write launch agent plist."],
        )
      }
      reloadLaunchAgent()
      result(true)
    } catch {
      result(FlutterError(
        code: "enable_failed",
        message: "Failed to enable launch agent: \(error)",
        details: nil
      ))
    }
  }

  private func disableLaunchAgent(result: @escaping FlutterResult) {
    do {
      unloadLaunchAgent()
      if fileManager.fileExists(atPath: launchAgentURL.path) {
        try fileManager.removeItem(at: launchAgentURL)
      }
      result(true)
    } catch {
      result(FlutterError(
        code: "disable_failed",
        message: "Failed to disable launch agent: \(error)",
        details: nil
      ))
    }
  }

  private func ensureLaunchAgentDirectory() throws {
    let directoryURL = launchAgentURL.deletingLastPathComponent()
    if !fileManager.fileExists(atPath: directoryURL.path) {
      try fileManager.createDirectory(
        at: directoryURL,
        withIntermediateDirectories: true,
        attributes: nil
      )
    }
  }

  private func createLaunchAgentPlist() throws -> NSDictionary {
    let bundlePath = Bundle.main.bundlePath
    if bundlePath.isEmpty {
      throw NSError(domain: "launch_at_startup", code: 1, userInfo: [
        NSLocalizedDescriptionKey: "Unable to determine bundle path.",
      ])
    }

    let programArguments = ["/usr/bin/open", bundlePath]
    let plist: [String: Any] = [
      "Label": launchAgentLabel,
      "RunAtLoad": true,
      "KeepAlive": false,
      "ProcessType": "Interactive",
      "ProgramArguments": programArguments,
    ]
    return plist as NSDictionary
  }

  private func reloadLaunchAgent() {
    let domain = "gui/\(userIdentifier)"
    let target = "\(domain)/\(launchAgentLabel)"

    _ = try? runLaunchctl(arguments: ["bootout", target])
    _ = try? runLaunchctl(arguments: ["bootstrap", domain, launchAgentURL.path])
  }

  private func unloadLaunchAgent() {
    let domain = "gui/\(userIdentifier)"
    let target = "\(domain)/\(launchAgentLabel)"
    _ = try? runLaunchctl(arguments: ["bootout", target])
  }

  @discardableResult
  private func runLaunchctl(arguments: [String]) throws -> Int32 {
    let process = Process()
    process.launchPath = "/bin/launchctl"
    process.arguments = arguments
    try process.run()
    process.waitUntilExit()
    return process.terminationStatus
  }
}
