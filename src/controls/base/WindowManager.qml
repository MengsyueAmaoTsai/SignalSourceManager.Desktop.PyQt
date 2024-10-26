pragma Singleton

import QtQuick

QtObject {
    id: windowManager

    property var routes: ({})
    property var activeWindows: []

    function addWindow(window) {
        if (window.transientParent) {
            console.log('Skipping registration of transient window:', window.route);
            return;
        }
        activeWindows.push(window);
        console.log('Window registered:', window.route);
    }

    function removeWindow(window) {
        if (window.transientParent) {
            console.log('Skipping removal for transient window:', window.route);
            return;
        }
        const index = activeWindows.indexOf(window);
        if (index === -1) {
            console.warn('Window not found in active windows for removal:', window.route);
            return;
        }
        activeWindows.splice(index, 1);
        window.deleteLater();
        console.log('Window removal and destroyed:', window.route);
    }

    function closeAllWindows(exitCode) {
        console.log('Closing all windows and exiting with return code:', exitCode);
        activeWindows.forEach(win => {
            console.log('Destroying window:', win.route);
            win.destroy();
        });
        activeWindows = [];
    }

    function quit(exitCode) {
        Qt.exit(exitCode);
    }

    function navigateTo(route, args = {}, windowRegister = undefined) {
        console.log("Navigating to route:", route, "with arguments:", args, 'and windowRegister:', windowRegister);
        if (!routes.hasOwnProperty(route)) {
            console.error('Route not found: ', route);
            return;
        }
        const windowComponent = Qt.createComponent(routes[route]);
        if (windowComponent.status !== Component.Ready) {
            console.error("Component creation failed:", windowComponent.errorString());
            return;
        }
        const existingWindow = findWindowByRoute(route);
        if (existingWindow) {
            console.log('Found existing window for route:', route);
            handleExistingWindow(existingWindow, args);
            return;
        }
        createAndRegisterNewWindow(windowComponent, route, args, windowRegister);
    }

    function findWindowByRoute(route) {
        const window = activeWindows.find(w => w.route === route);
        if (window) {
            console.log('Existing window found for route:', route);
        } else {
            console.log('No existing window found for route:', route);
        }
        return window || null;
    }

    function handleExistingWindow(window, args) {
        console.log("Handling existing window for route:", window.route, "with launch mode:", window.launchMode);
        if (window.launchMode === 1) {
            updateWindowArguments(window, args);
        } else if (window.launchMode === 2) {
            console.log("Closing existing window for route:", window.route);
            window.close();
        }
    }

    function createAndRegisterNewWindow(component, route, args, windowRegister) {
        console.log("Creating new window for route:", route, "with arguments:", args);
        const properties = {
            route: route,
            arguments: args
        };
        if (windowRegister) {
            properties.windowRegister = windowRegister;
            console.log("Window register provided for new window.");
        }
        const newWindow = component.createObject(null, properties);
        if (newWindow) {
            console.log("New window created for route:", route);
            addWindow(newWindow);
            if (windowRegister) {
                windowRegister._to = newWindow;
                console.log("Window registered in windowRegister.");
            }
        } else {
            console.error("Failed to create new window for route:", route);
        }
    }
}
