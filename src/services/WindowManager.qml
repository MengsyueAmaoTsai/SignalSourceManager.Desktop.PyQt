pragma Singleton

import QtQuick

QtObject {
    property var routes: {}
    property var windows: []
s
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
        properties._route = route;
        if (windowRegister) {
            properties._windowRegister = windowRegister;
        }
        properties.argument = args;
        var win = undefined;
        for (var i = 0; i < windows.length; i++) {
            var item = windows[i];
            if (route === item._route) {
                win = item;
                break;
            }
        }
        if (win) {
            var launchMode = win.launchMode;
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
