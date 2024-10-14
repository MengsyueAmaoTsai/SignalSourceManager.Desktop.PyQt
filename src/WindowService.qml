pragma Singleton

import QtQuick

QtObject {
    property var routes: ({})
    property var windows: []

    function mapRoutes(routeMapping) {
        routes = routeMapping;
    }

    function navigateTo(route, args = {}, windowRegister = undefined) {
        if (!routes.hasOwnProperty(route)) {
            console.error('Route not found:', route);
            return;
        }
        const url = routes[route];
        const window = Qt.createComponent(url);
        if (window === null) {
            console.error('Failed to create window: ', url);
            return;
        }
        if (window.status !== Component.Ready) {
            console.error(window.errorString());
            return;
        }
        const properties = {};
        properties.route = route;
        if (windowRegister) {
            properties.windowRegister = windowRegister;
        }
        properties.arguments = args;
        let win = undefined;
        for (var i = 0; i < windows.length; i++) {
            var currentWindow = windows[i];
            if (route === currentWindow.route) {
                win = currentWindow;
                break;
            }
        }
        if (win) {
            var launchMode = win.launchMode;
            if (launchMode === 1) {
                win.argument = argument;
                win.show();
                win.raise();
                win.requestActivate();
                return;
            } else if (launchMode === 2) {
                win.close();
            }
        }
        win = window.createObject(null, properties);
        if (windowRegister) {
            windowRegister.to = win;
        }
    }
}
