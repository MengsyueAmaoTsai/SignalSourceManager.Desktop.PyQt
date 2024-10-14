import QtQuick
import QtQuick.Controls

Rectangle {
    id: control

    Component.onCompleted: {
        console.log('AppBar.qml loaded');
    }

    Component.onDestruction: {
        console.log('AppBar.qml destroyed');
    }
}
