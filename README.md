# Dockshift

Dockshift is a native macOS menu-bar app for managing keyboard, mouse, monitor, and Dock settings from one place.

## Current milestone

The project currently contains the working app foundation:

- A SwiftUI menu-bar app
- A settings window
- Separate Keyboard, Mouse, Monitor, and Dock Setup modules
- Shared preferences storage
- Monitor discovery using public macOS display APIs
- Display names, IDs, resolutions, and built-in/external status
- A structure ready for additional macOS system integrations

The next Monitor milestone is real brightness control. Keyboard, Mouse, and Dock behavior will be connected one module at a time after the monitor foundation is tested.
