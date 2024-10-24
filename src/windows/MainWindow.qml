import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

BaseWindow {
    id: window
    title: 'Main'

    width: 1000
    height: 668
    minimumWidth: 668
    minimumHeight: 320

    // Component.onCompleted: console.log('MainWindow created.')
    // Component.onDestruction: WindowManager.exit()

    Flipable {
        id: flipable
        anchors.fill: parent
    }
}
