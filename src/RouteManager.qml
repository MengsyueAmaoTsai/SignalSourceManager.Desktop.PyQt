pragma Singleton

import QtQuick

QtObject {
    property var routes: ({})
    property var windows: []

    function addWindow(window) {
        console.log("Adding window...", window);
    }

    function removeWindow(window) {
        console.log("Removing window...", window);
    }

    function exit(returnCode) {
        console.log("Exiting... return code: ", returnCode);
    }

    function navigate(route, args = {}, windowRegister = undefined) {
        console.log("Navigating to...", route, args, windowRegister);
    }
}
