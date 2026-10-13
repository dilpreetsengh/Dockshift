import Foundation

public enum ModuleKind: String, CaseIterable, Sendable {
    case keyboard = "Keyboard"
    case mouse = "Mouse"
    case monitor = "Monitor"
    case dockSetup = "Dock Setup"
}

public enum ModuleState: Equatable, Sendable {
    case notConnected
    case ready
    case permissionNeeded
    case unavailable(String)
}

public protocol DockshiftModule: AnyObject {
    var kind: ModuleKind { get }
    var state: ModuleState { get }
    func start()
    func stop()
}
