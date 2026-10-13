import DockshiftCore

public final class DockSetupModule: DockshiftModule {
    public let kind: ModuleKind = .dockSetup
    public private(set) var state: ModuleState = .notConnected

    public init() {}

    public func start() {
        state = .ready
    }

    public func stop() {
        state = .notConnected
    }
}
