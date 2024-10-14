import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

ApplicationWindow {
    id: root
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: {
        const routeMapping = {
            '/': 'qrc:/src/views/Home/Home.qml'
        };
        WindowService.mapRoutes(routeMapping);
        WindowService.navigateTo('/');
    }
}
