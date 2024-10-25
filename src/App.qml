import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Item {
    id: app

    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: {
        WindowManager.routes = {
            '/': 'qrc:/src/windows/MainWindow.qml',
            // Gallery
            '/gallery': 'qrc:/src/windows/gallery/GalleryMainWindow.qml'
        };
        const args = Qt.application.arguments;
        WindowManager.navigateTo('/gallery');
    }
}
