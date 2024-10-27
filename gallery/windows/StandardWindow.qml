import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window
    title: 'Standard'
    width: 500
    height: 600

    // fixedSize: true
    // launchMode:
    BaseControls.TextBlock {
        anchors.centerIn: parent
        text: 'I am a Standard mode window, and every time I create a new window'
    }
}
