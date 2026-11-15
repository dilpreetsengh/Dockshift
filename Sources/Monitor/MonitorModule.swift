import AppKit
import DockshiftCore

@MainActor
public final class MonitorModule: DockshiftModule {
    public let kind: ModuleKind = .monitor
    public private(set) var state: ModuleState = .notConnected
    public private(set) var connectedDisplayCount = 0

    public init() {}

    public func start() {
        refreshDisplays()
        state = .ready
    }

    public func stop() {
        connectedDisplayCount = 0
        state = .notConnected
    }

    public func refreshDisplays() {
        connectedDisplayCount = NSScreen.screens.count
    }
}
