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
    property var arguments: ({})

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

    property int resizeBorderWidth: 1
    property color resizeBorderColor: window.active ? Qt.rgba(51 / 255, 51 / 255, 51 / 255, 1) : Qt.rgba(61 / 255, 61 / 255, 61 / 255, 1)

    readonly property color backgroundColor: {
        return color_provider.windowActiveBackgroundColor;
    }

    QtObject {
        id: dataContext
    }

    Connections {
        target: window
        function onClosing(event) {
            console.log('onClosing', event);
        }
    }

    // FluentFrameless {}
    Component {
        id: backgroundComponent
        Item {}
    }

    Component {
        id: appTitleBarComponent
        Item {}
    }

    Component {
        id: loadingComponent
        Popup {}
    }

    Component {
        id: borderComponent
        Rectangle {
            color: 'transparent'
            border.width: window.resizeBorderWidth
            border.color: window.resizeBorderColor
        }
    }

    Item {
        ComponentLoader {
            sourceComponent: backgroundComponent
            anchors.fill: parent
        }

        ComponentLoader {
            id: appTitleBarLoader
            sourceComponent: appTitleBarComponent
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            height: {
                // if (window.useSystemAppTitleBar) {
                //     return 0
                // }
                return window.appTitleBar.height;
            }
        }

        Item {
            clip: true
        }

        ComponentLoader {
            anchors.fill: parent
        }

        // FluentInfoBar

        ComponentLoader {
            sourceComponent: borderComponent
            anchors.fill: parent
        }
    }

    Component.onCompleted: {
        WindowManager.addWindow(window);
        argumentsInitialized(window.arguments);
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

    onVisibleChanged: console.log('visibleChanged', visible)

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
