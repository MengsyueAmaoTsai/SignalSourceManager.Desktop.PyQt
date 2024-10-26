import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window
    width: 800
    height: 600
    minimumWidth: 520
    minimumHeight: 200

    // launchMode: FluWindowType.SingleInstance

    Loader {
        id: loader
        anchors.fill: parent
    }

    onArgumentsInitialized: args => console.log('Arguments initialized:', args)
}
