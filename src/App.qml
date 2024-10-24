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
            '/about': 'qrc:/src/windows/AboutWindow.qml'
        };
        const args = Qt.application.arguments;
        console.log('Arguments:', args);
        WindowManager.navigateTo('/');
    }

    Component.onDestruction: console.log("ViewModel: " + main_view_model)
}
