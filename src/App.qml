import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import "./controls/LeftNavBar"
import "./controls/Dashboard"
import "./controls/LogConsole"
import "./views/Home"

ApplicationWindow {
    id: app
    title: mainViewModel.app_title
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: {
        mainViewModel.initialize();
        console.log('Application loaded');
    }

    Component.onDestruction: {
        console.log('Application destroyed');
    }

    Shortcut {
        sequence: "Ctrl+R"
        onActivated: devTool.reload()
    }

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }

    Shortcut {
        sequence: "Ctrl+D"
        onActivated: dashboard.visible = !dashboard.visible
    }

    Shortcut {
        sequence: "Ctrl+L"
        onActivated: logConsole.visible = !logConsole.visible
    }

    menuBar: MenuBar {
        Menu {
            title: 'File'
            Action {
                text: 'Open Log Console'
                onTriggered: logConsole.visible = true
            }
        }
    }

    RowLayout {
        id: appLayout
        anchors.fill: parent
        spacing: 0

        // LeftSideBar //
        LeftNavBar {
            id: leftNavBar
        }

        StackView {
            id: pageStack
            initialItem: homePageComponent
        }
    }

    // Pages
    Component {
        id: homePageComponent
        Home {}
    }

    // Windows
    Dashboard {
        id: dashboard
    }

    LogConsole {
        id: logConsole
    }
}
