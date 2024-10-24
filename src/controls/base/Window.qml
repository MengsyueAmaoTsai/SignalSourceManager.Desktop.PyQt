import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Services

Window {
    id: window

    property var argument: {}
    property var windowRegister: undefined
    property string route: ''

    property bool autoMaximize: false
    property bool autoVisible: true
    property bool autoCenter: true
    property bool autoDestroy: true
    property bool stayTop: false
    property bool showDark: false
    property bool showClose: true
    property bool showMinimize: true
    property bool showMaximize: true
    property bool showStayTop: false

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
