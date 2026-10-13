import DockshiftCore

public final class KeyboardModule: DockshiftModule {
    public let kind: ModuleKind = .keyboard
    public private(set) var state: ModuleState = .notConnected

    public init() {}

    public func start() {
        state = .ready
    }

    public func stop() {
        state = .notConnected
    }
}
