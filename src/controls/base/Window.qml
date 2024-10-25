import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: control

    property string route: ''
    property var arguments: ({})
    property var windowRegister

    signal argumentsInitialized(var args)
    signal lazyLoaded

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
