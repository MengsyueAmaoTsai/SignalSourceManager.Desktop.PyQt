import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Item {
    id: root
    visible: true

    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: {
        WindowManager.routes = {
            '/': 'qrc:/src/windows/MainWindow.qml',
            '/dev': 'qrc:/src/windows/DevelopmentWindow.qml',
            '/signal-sources/details': 'qrc:/src/windows/SignalSourceDetailsWindow.qml',
            // Demo routes
            '/pages': 'qrc:/src/windows/demo/PagesWindow.qml',
            '/buttons': 'qrc:/src/windows/demo/ButtonsWindow.qml'
        };
        const args = Qt.application.arguments;
        WindowManager.navigateTo('/pages');
    }

    Component.onDestruction: console.log("ViewModel: " + main_view_model)
}
