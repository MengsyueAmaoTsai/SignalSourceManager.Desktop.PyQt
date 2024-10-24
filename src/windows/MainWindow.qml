import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window
    title: 'Main'

    width: 1000
    height: 668
    minimumWidth: 668
    minimumHeight: 320

    Component.onCompleted: console.log('MainWindow created')
    Component.onDestruction: WindowManager.exit()

    SystemTrayIcon {
        id: trayIcon
        visible: true
        tooltip: 'RichillCapital.SignalSourceMananger.Desktop'

        menu: Menu {
            MenuItem {
                text: 'Quit'
                onTriggered: WindowManager.exit()
            }
        }

        onActivated: reason => console.log('Not implemented trayIcon.onActivated', reason)
    }
}
