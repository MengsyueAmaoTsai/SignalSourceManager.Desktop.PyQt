import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: qsTr("SingleTask")
    width: 500
    height: 600
    fixSize: true

    // launchMode: FluWindowType.SingleTask

    BaseControls.TextBlock {
        anchors.centerIn: parent
        text: qsTr("I'm a SingleTask mode window, and if I exist, I activate the window")
    }
}
