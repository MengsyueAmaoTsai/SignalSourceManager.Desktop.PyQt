import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Window {
    id: window

    color: window.backgroundColor

    signal argumentsInitialized(var arguments)
    signal lazyLoaded

    property var windowRegister: undefined
    property string route: ''
    property var arguments: {}

    property bool autoMaximize: false
    property bool autoVisible: true
    property bool autoCenter: true
    property bool autoDestroy: true
    property bool stayTop: false
    property bool showDark: false
    property bool showClose: true
    property bool showMinimize: true
    property bool showMaximize: true
    property Item appTitleBar: FluentAppTitleBar {}

    readonly property color backgroundColor: {
        return color_provider.windowActiveBackgroundColor;
    }

    QtObject {}
    Connections {}
    // FluentFrameless {}
    // Component {}
    // Component {}
    // Component {}
    // Component {}
    Item {}

    Component.onCompleted: {
        WindowManager.addWindow(window);
        argumentsInitialized(arguments);
        moveToDesktopCenter();
        fixWindowSize();
        if (window.autoVisible) {
            if (window.autoMaximize) {
                window.visibility = Window.Maximized;
            } else {
                window.show();
            }
        }
    }

    function moveToDesktopCenter() {
        console.log('moveToDesktopCenter');
    }

    function fixWindowSize() {
        window.maximumWidth = window.width;
        window.maximumHeight = window.height;
        window.minimumWidth = window.width;
        window.minimumHeight = window.height;
    }
}
