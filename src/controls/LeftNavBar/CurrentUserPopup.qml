import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Popup {
    id: root
    implicitWidth: 170
    implicitHeight: 130
    padding: 0
    background: Rectangle {
        color: '#000000'
        radius: 5
        anchors.fill: parent
    }

    ColumnLayout {
        id: layout
        width: parent.width
    }
}
