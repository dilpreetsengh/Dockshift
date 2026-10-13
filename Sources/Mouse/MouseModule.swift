import DockshiftCore

public final class MouseModule: DockshiftModule {
    public let kind: ModuleKind = .mouse
    public private(set) var state: ModuleState = .notConnected

    public init() {}

    public func start() {
        state = .ready
    }

    public func stop() {
        state = .notConnected
    }
}
