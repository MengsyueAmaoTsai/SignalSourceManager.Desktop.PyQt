pragma Singleton

import QtQuick

QtObject {
    id: root

    property var routes: ({})
    property var windows: []

    function addWindow(window) {
        console.log("Adding window...", window);
    }

    function removeWindow(window) {
        console.log("Removing window...", window);
    }

    function exit(returnCode) {
        for (let i = 0; i < windows.length; i++) {
            const window = windows[i];
            window.deleteLater();
        }
        windows = [];
        Qt.exit(returnCode);
    }

    function navigateTo(route, args = {}, windowRegister = undefined) {
        console.log(`[WindowManager] - Navigating to route: ${route}`);
    }

    function mapRoutes(routesMap) {
        routes = routesMap;
    }
}
