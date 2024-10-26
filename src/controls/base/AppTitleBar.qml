import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Rectangle {
    id: control

    color: Qt.rgba(0, 0, 0, 0)
    height: visible ? 30 : 0
    opacity: visible
    z: 65535

    RowLayout {
        spacing: 0
        anchors.right: parent.right
        height: parent.height
    }
}
