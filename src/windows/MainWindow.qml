import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window

    title: 'RichillCapital SignalSourceManager - Home'
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    SystemTrayIcon {
        id: systemTray
        visible: true
        icon.source: 'qrc:/static/images/favicon.ico'
        tooltip: 'RichillCapital SignalSourceManager'
        menu: Menu {
            MenuItem {
                text: 'Exit'
                onTriggered: WindowManager.closeAllWindowsAndExit()
            }
        }
        onActivated: reason => {
            console.log('SystemTrayIcon.onActivated. Reason:', reason);
        }
    }

    Component.onCompleted: console.warn('MainWindow.qml Component.onCompleted')
    Component.onDestruction: WindowManager.closeAllWindowsAndExit()
}
