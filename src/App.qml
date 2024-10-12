import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: app
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    Component.onCompleted: mainViewModel.initialize()
}
