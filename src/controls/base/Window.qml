import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Services

Window {
    id: window

    property var argument: {}
    property string route: ''

    Component.onCompleted: {
        WindowManager.addWindow(window);
    }
}
