import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import BaseControls
import Services

ApplicationWindow {
    id: root
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    visible: true

    Component.onCompleted: {
        console.log('App.qml loaded');
        const routeMapping = {
            '/': 'qrc:/src/views/Home/Home.qml'
        };
        WindowService.mapRoutes(routeMapping);
        WindowService.navigateTo('/');
    }

    Component.onDestruction: {
        console.log('App.qml destroyed');
    }
}
