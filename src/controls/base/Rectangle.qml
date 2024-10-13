import QtQuick

Item {
    id: control

    anchors.fill: parent

    property int radius: 4

    Rectangle {
        width: control.width
        height: control.height
        anchors.centerIn: parent
        color: "#00000000"
        border.width: 2
        radius: control.radius
        border.color: Qt.rgba(1, 1, 1, 1)
        z: 65535
    }
}
