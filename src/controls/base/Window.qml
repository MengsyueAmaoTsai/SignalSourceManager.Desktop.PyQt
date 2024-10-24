import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Services

Window {
    id: window

    property var argument: {}
    property string route: ''

    property bool autoMaximize: false
    property bool autoVisible: true
    property bool autoCenter: true
    property bool autoDestroy: true

    Component.onCompleted: {
        WindowManager.addWindow(window);
        if (window.autoVisible) {
            if (window.autoMaximize) {
                window.visibility = Window.Maximized;
            } else {
                window.show();
            }
        }
    }
}
