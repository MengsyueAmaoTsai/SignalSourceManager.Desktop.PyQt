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

    property int resizeBorderWidth: 1
    property color resizeBorderColor: window.active ? Qt.rgba(51 / 255, 51 / 255, 51 / 255, 1) : Qt.rgba(61 / 255, 61 / 255, 61 / 255, 1)

    readonly property color backgroundColor: {
        return color_provider.windowActiveBackgroundColor;
    }

    property Item appTitleBar: FluentAppTitleBar {}

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
        Item {
            Rectangle {
                anchors.fill: parent
            }

            Image {
                visible: false
                cache: false
                asynchronous: true

                Connections {}
                Connections {}
                Timer {}
                Component.onCompleted: {
                    console.log('backgroundComponent', window.backgroundImage);
                }
            }

            // FluentAcrylic {}
        }
    }

    Component {
        id: appTitleBarComponent
        Item {
            data: window.appTitleBar
            Component.onCompleted: {
                window.appTitleBar.width = Qt.binding(function () {
                    return this.parent.width;
                });
            }
        }
    }

    Component {
        id: loadingComponent
        Popup {
            Overlay.modal: Item {}
            focus: true
            width: window.width
            height: window.height
            anchors.centerIn: Overlay.overlay
            closePolicy: {
                if (cancel) {
                    return Popup.CloseOnEscape | Popup.CloseOnPressOutside;
                }
                return Popup.NoAutoClose;
            }
            padding: 0
            opacity: 0
            visible: true

            background: Rectangle {
                color: '#44000000'
            }

            contentItem: Item {
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log('onClicked');
                    }
                }
                ColumnLayout {
                    spacing: 8
                    anchors.centerIn: parent
                    // FluentProgressRing {}
                    FluentTextBlock {
                        text: 'Loading...'
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }

            Behavior on opacity {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 83
                    }
                    NumberAnimation {
                        duration: 67
                    }
                }
            }

            Component.onCompleted: opacity = 1

            onVisibleChanged: {
                if (!visible) {
                    loadingLoader.sourceComponent = undefined;
                }
            }
        }
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
        anchors.fill: parent
        anchors.margins: 0
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
            anchors {
                top: appTitleBarLoader.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            clip: true
        }

        ComponentLoader {
            id: loadingLoader
            anchors.fill: parent
        }

        // FluentInfoBar

        ComponentLoader {
            id: borderLoader
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
