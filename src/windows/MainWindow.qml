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

    Component.onCompleted: console.warn('MainWindow.qml Component.onCompleted')
    Component.onDestruction: WindowManager.closeAllWindowsAndExit()
}
