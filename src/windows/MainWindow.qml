import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window

    title: 'Home'
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: {
        console.log('Main window completed');
    }

    Component.onDestruction: {
        WindowManager.closeAllWindowsAndExit();
        console.log('Main window desctruction');
    }

    Flipable {
        id: flipable

        anchors.fill: parent
        transform: Rotation {}
        transitions: Transition {}

        front: Item {
            anchors.fill: flipable

            FluentNavigationView {
                id: navigationView
                width: parent.width
                height: parent.height
            }
        }

        back: Item {
            anchors.fill: flipable

            Row {
                Component.onCompleted: {
                    console.log('Back row created!');
                }
            }
        }
    }
}
