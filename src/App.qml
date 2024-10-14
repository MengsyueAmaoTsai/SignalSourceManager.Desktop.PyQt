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
            '/': 'qrc:/src/views/Home/Home.qml',
            '/about': 'qrc:/src/views/About/About.qml',
            '/sign-in': 'qrc:/src/views/SignIn/SignIn.qml',
            '/hotload': 'qrc:/src/views/HotLoad/HotLoad.qml',
            '/crash': 'qrc:/src/views/Crash/Crash.qml',
            '/single-task': 'qrc:/src/views/SingleTask/SingleTask.qml',
            '/standard': 'qrc:/src/views/Standard/Standard.qml',
            '/single-instance': 'qrc:/src/views/SingleInstance/SingleInstance.qml',
            '/page': 'qrc:/src/views/Page/Page.qml'
        };
        WindowService.mapRoutes(routeMapping);
        WindowService.navigateTo('/');
    }

    Component.onDestruction: {
        console.log('App.qml destroyed');
    }
}
