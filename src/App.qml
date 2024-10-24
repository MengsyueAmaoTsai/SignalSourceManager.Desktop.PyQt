import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

ApplicationWindow {
    id: root
    visible: true

    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: {
        console.log("ViewModel: " + main_view_model);
    }

    Component.onDestruction: {
        console.log("ViewModel: " + main_view_model);
    }

    BaseTable {
        id: signalSourceTable

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
    }
}
