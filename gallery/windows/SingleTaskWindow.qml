import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: "SingleTask"
    width: 500
    height: 600

    // fixedSize: true
    // launchMode: FluWindowType.SingleTask

    BaseControls.TextBlock {
        anchors.centerIn: parent
        text: qsTr("I'm a SingleTask mode window, and if I exist, I activate the window")
    }
}
