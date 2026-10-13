import DockshiftCore

public final class MonitorModule: DockshiftModule {
    public let kind: ModuleKind = .monitor
    public private(set) var state: ModuleState = .notConnected

    public init() {}

    public func start() {
        state = .ready
    }

    public func stop() {
        state = .notConnected
    }
}
