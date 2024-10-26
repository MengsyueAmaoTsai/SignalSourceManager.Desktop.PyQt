import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Window {
    id: control

    signal argumentsInitialized(var args)
    signal lazyLoaded

    property string route: ''
    property var arguments: ({})
    property var windowRegister

    readonly property color backgroundColor: {
        // TODO other cases

        if (active) {
            return AppTheme.window_active_background_color;
        }
        return AppTheme.window_background_color;
    }

    property Item appTitleBar: BaseControls.AppTitleBar {
        title: 'RichillCapital.SignalSourceManager.Desktop'
        iconSource: 'qrc:/static/images/favicon.ico'
        height: 30
    }

    Component {
        id: backgroundWrapper

        Item {
            Rectangle {
                anchors.fill: parent
                color: control.backgroundColor
            }

            Image {
                visible: false
                cache: false
                fillMode: Image.PreserveAspectCrop
                asynchronous: true

                Component.onCompleted: console.log('TODO: Load background image')
            }
        }
    }

    Component {
        id: appTitleBarWrapper
        Item {
            data: control.appTitleBar
            Component.onCompleted: {
                control.appTitleBar.width = Qt.binding(function () {
                    return this.parent.width;
                });
            }
        }
    }

    Item {
        anchors.fill: parent
        anchors.margins: 0 // control.__margins

        // Background
        BaseControls.ComponentLoader {
            id: backgroundLoader
            anchors.fill: parent
            sourceComponent: backgroundWrapper
        }

        // AppTitleBar
        BaseControls.ComponentLoader {
            id: appTitleBarLoader
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            sourceComponent: appTitleBarWrapper
        }

        // Loading
        BaseControls.ComponentLoader {
            anchors.fill: parent
        }

        // Info Bar

        // Border
        BaseControls.ComponentLoader {
            id: borderLoader
            anchors.fill: parent
        }
    }

    // Background component
    // Border component
    // AppTitleBar component
    // Loading component

    Connections {
        target: control
        function onClosing(event) {
            console.log('Window closing event:', event);
        }
    }

    Component.onCompleted: {
        WindowManager.addWindow(control);
        // useSystemAppTitleBar = FluentApp.useSystemAppTitleBar;

        // if (!useSystemAppBar && autoCenter) {
        //     moveWindowToDesktopCenter()
        //     console.info("Window moved to desktop center")
        // }
        // fixWindowSize()
        console.info("Window size fixed");
        argumentsInitialized(arguments);

        // if (!control.autoVisible) {
        //     console.info('Window is not set to auto visible, skipping display.');
        //     return;
        // }
        // if (control.autoMaximize) {
        //     control.visibility = Window.Maximized;
        //     console.info('Window set to Maximized visibility');
        // } else {
        //     control.show();
        //     console.info('Window shown');
        // }
        control.show();
    }

    onVisibleChanged: console.log('Window visibility changed to', visible)
}
