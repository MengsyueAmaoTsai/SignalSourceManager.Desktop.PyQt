import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window

    width: 800
    height: 600
    minimumWidth: 520
    minimumHeight: 200

    // launchMode: FluWindowType.SingleInstance
    onArgumentsInitialized: args => {
        window.title = args.title;
        loader.setSource(args.url, {
            animationEnabled: false
        });
    }

    ComponentLoader {
        id: loader
        anchors.fill: parent
    }
}
