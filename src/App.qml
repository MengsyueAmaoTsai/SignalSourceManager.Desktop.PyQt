import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import BaseControls

ApplicationWindow {
    id: root
    visible: true
    width: 400
    height: 400

    Component.onCompleted: {
        console.log('[ApplicationWindow.OnCompleted]');
        WindowManager.mapRoutes({
            '/': 'qrc:/src/views/Home/Home.qml'
        });
        const args = Qt.application.arguments;
        WindowManager.navigateTo('/');
    }
}
