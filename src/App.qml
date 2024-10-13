import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import "./controls/LeftNavBar"
import "./views/Home"

ApplicationWindow {
    id: app
    title: mainViewModel.app_title
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    minimumHeight: 600
    minimumWidth: 900

    Component.onCompleted: {
        mainViewModel.initialize();
        console.log('Application loaded');
    }

    Component.onDestruction: console.log('Application destroyed')

    Shortcut {
        sequence: "Ctrl+R"
        onActivated: devTool.reload()
    }

    RowLayout {
        id: appLayout
        anchors.fill: parent

        LeftNavBar {
            id: leftNavBar
            z: 1
            visible: true
        }

        StackView {
            id: pageStack
            initialItem: homePage
        }
    }

    // Pages
    Component {
        id: homePage
        Home {}
    }

    // Windows
}
