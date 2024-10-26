import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Window {
    id: control

    signal argumentsInitialized(var args)

    property var windowRegister: undefined
    property string route: ''
    property var arguments: ({})

    Connections {
        target: control
        function onClosing(event) {
            console.log('TODO: Implement Window.qml onClosing');
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
}
