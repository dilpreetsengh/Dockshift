import DockSetup
import Keyboard
import Monitor
import Mouse
import SwiftUI

@main
struct DockshiftApp: App {
    @StateObject private var model = DockshiftAppModel()

    var body: some Scene {
        MenuBarExtra("Dockshift", systemImage: "slider.horizontal.3") {
            DockshiftMenu(model: model)
        }
        .menuBarExtraStyle(.menu)
    }
}

@MainActor
final class DockshiftAppModel: ObservableObject {
    let keyboard = KeyboardModule()
    let mouse = MouseModule()
    let monitor = MonitorModule()
    let dockSetup = DockSetupModule()

    init() {
        keyboard.start()
        mouse.start()
        monitor.start()
        dockSetup.start()
    }

    deinit {
        keyboard.stop()
        mouse.stop()
        monitor.stop()
        dockSetup.stop()
    }

    func state(for kind: ModuleKind) -> ModuleState {
        switch kind {
        case .keyboard: keyboard.state
        case .mouse: mouse.state
        case .monitor: monitor.state
        case .dockSetup: dockSetup.state
        }
    }
}

struct DockshiftMenu: View {
    @ObservedObject var model: DockshiftAppModel

    var body: some View {
        ForEach(ModuleKind.allCases, id: \.self) { kind in
            Label {
                Text(kind.rawValue)
            } icon: {
                Image(systemName: iconName(for: kind))
            }
        }

        Divider()

        Button("Quit Dockshift") {
            NSApplication.shared.terminate(nil)
        }
    }

    private func iconName(for kind: ModuleKind) -> String {
        switch kind {
        case .keyboard: "keyboard"
        case .mouse: "computermouse"
        case .monitor: "display"
        case .dockSetup: "dock.rectangle"
        }
    }
}
