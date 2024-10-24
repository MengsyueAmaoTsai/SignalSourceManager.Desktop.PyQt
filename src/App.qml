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
            '/hotload': 'qrc:/src/windows/HotloadWindow.qml',
            '/hotkey': 'qrc:/src/windows/HotkeyWindow.qml',
            '/sign-in': 'qrc:/src/windows/SignInWindow.qml',
            '/crash': 'qrc:/src/windows/CrashWindow.qml',
            '/pages': 'qrc:/src/windows/PageWindow.qml',
            '/about': 'qrc:/src/windows/AboutWindow.qml',
            '/standard': 'qrc:/src/windows/StandardWindow.qml',
            '/single-instance': 'qrc:/src/windows/SingleInstanceWindow.qml',
            '/single-task': 'qrc:/src/windows/SingleTaskWindow.qml'
        };
        const args = Qt.application.arguments;
        WindowManager.navigateTo('');
    }

    Component.onDestruction: console.log("ViewModel: " + main_view_model)
}
