import QtQuick

Window {
    id: root
    title: 'Dashboard'
    visible: false
    width: Screen.width * 0.5
    height: Screen.height * 0.5

    Shortcut {
        sequence: "Ctrl+D"
        onActivated: root.visible = !root.visible
    }

    Shortcut {
        sequence: "Esc"
        onActivated: root.visible = false
    }
}
