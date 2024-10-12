import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import "./controls/LeftNavBar"

ApplicationWindow {
    id: app
    title: mainViewModel.app_title
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    Component.onCompleted: mainViewModel.initialize()

    Shortcut {
        sequence: "Ctrl+R"
        onActivated: devTool.reload()
    }

    RowLayout {
        id: appLayout
        anchors.fill: parent
        spacing: 0

        // LeftSideBar //
        LeftNavBar {
            id: leftNavBar
        }

        Text {
            text: "sss "
            anchors.fill: parent
        }
    }
}
