import QtQuick
import QtQuick.Controls
import QtQuick.Window

ApplicationWindow {
    id: app
    title: mainViewModel.app_title
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    minimumHeight: 600
    minimumWidth: 900

    Component.onCompleted: {
        mainViewModel.initialize();
        console.log('Application loaded');
    }

    Component.onDestruction: console.log('Application destroyed')
}
