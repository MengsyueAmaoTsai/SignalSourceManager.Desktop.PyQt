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

    // TODO: Add windowRegister logic
    }
}
