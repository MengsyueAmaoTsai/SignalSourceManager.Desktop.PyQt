import QtQuick
import QtQuick.Controls

Window {
    id: window

    signal argumentsInitialized(var arguments)
    signal lazyLoaded

    property var windowRegister: undefined
    property string route: ''
    property var argument: {}

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

    property Item appBar: AppBar {
        title: window.title
        height: 30
        showDark: window.showDark
        showClose: window.showClose
        showMinimize: window.showMinimize
        showMaximize: window.showMaximize
        showStayTop: window.showStayTop
        // icon: window.windowIcon
    }

    Component.onCompleted: {
        WindowManager.addWindow(window);
        argumentsInitialized(argument);
        if (window.autoVisible) {
            if (window.autoMaximize) {
                window.visibility = Window.Maximized;
            } else {
                window.show();
            }
        }
    }
}
