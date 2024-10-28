import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: "SingleTask"
    width: 800
    height: 600
    fixSize: true

    launchMode: 'SingleTask'

    BaseControls.TextBlock {
        anchors.centerIn: parent
        text: "I'm a SingleTask mode window, and if I exist, I activate the window"
    }
}
