pragma Singleton

import QtQuick

QtObject {
    property var routes: {}
    property var windows: []

    function addWindow(window) {
        if (!window.transientParent) {
            windows.push(window);
            console.log('Window added:', window.route);
        }
    }

    function removeWindow(win) {
        console.log('Closing window: ', win.route);
        if (!win.transientParent) {
            var index = windows.indexOf(win);
            if (index !== -1) {
                windows.splice(index, 1);
                win.deleteLater();
                console.log('Window removed:', win.route);
            }
        }
    }

    function exit(returnCode) {
        for (let i = 0; i < windows.length; i++) {
            const win = windows[i];
            console.log('Closing window:', win.route);
            win.deleteLater();
        }
        windows = [];
        Qt.exit(returnCode);
    }

    function navigateTo(route, args = {}, windowRegister = undefined) {
        if (!routes.hasOwnProperty(route)) {
            console.error('Route not found: ', route);
            return;
        }
        const windowComponent = Qt.createComponent(routes[route]);
        if (windowComponent.status !== Component.Ready) {
            console.error('Failed to create window component: ', windowComponent.errorString());
            return;
        }
        const properties = {};
        properties.route = route;
        if (windowRegister) {
            properties.windowRegister = windowRegister;
        }
        properties.argument = args;
        var win = undefined;
        for (var i = 0; i < windows.length; i++) {
            var item = windows[i];
            if (route === item.route) {
                win = item;
                break;
            }
        }
        if (win) {
            var launchMode = win.launchMode;
            console.log('Navigate to existing window:', route, launchMode);
            if (launchMode === 1) {
                win.argument = args;
                win.show();
                win.raise();
                win.requestActivate();
                return;
            } else if (launchMode === 2) {
                win.close();
            }
        }
        win = windowComponent.createObject(null, properties);
        if (windowRegister) {
            windowRegister._to = win;
        }
    }
}
