import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window

    title: 'Fluent UI Buttons'
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    RowLayout {
        FluentButton {
            onClicked: {
                console.log('Button clicked');
            }

            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
            }
        }

        FluentToggleSwitch {
            id: buttonSwitch

            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
        }
    }
}
