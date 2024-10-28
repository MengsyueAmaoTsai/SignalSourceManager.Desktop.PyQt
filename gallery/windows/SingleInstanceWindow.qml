import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: "SingleInstance"
    width: 500
    height: 600
    fixSize: true
    launchMode: 'SingleInstance'

    BaseControls.TextBox {
        anchors {
            top: parent.top
            topMargin: 60
            horizontalCenter: parent.horizontalCenter
        }
    }

    BaseControls.TextBlock {
        wrapMode: Text.WrapAnywhere
        anchors {
            left: parent.left
            right: parent.right
            leftMargin: 20
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        text: "I'm a SingleInstance window, and if I exist, I'll destroy the previous window and create a new one"
    }
}
