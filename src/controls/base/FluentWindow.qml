import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: window

    color: window.backgroundColor

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

    readonly property color backgroundColor: {
        return color_provider.windowBackgroundColor;
    }

    property var closingHandler: function (event) {
        if (autoDestroy) {
            WindowManager.removeWindow(window);
        } else {
            window.visibility = Window.Hidden;
            // event.accepted = false;
        }
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
