import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

ApplicationWindow {
    id: root
    visible: true

    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: console.log("ViewModel: " + main_view_model);
    Component.onDestruction: console.log("ViewModel: " + main_view_model);
}
