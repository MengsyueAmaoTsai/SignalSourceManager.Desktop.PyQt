import QtQuick

Window {
    id: root
    title: 'Log Console'
    visible: false
    width: Screen.width * 0.5
    height: Screen.height * 0.5

    Shortcut {
        sequence: "Ctrl+L"
        onActivated: root.visible = !root.visible
    }

    Shortcut {
        sequence: "Esc"
        onActivated: root.visible = false
    }
}
