import QtQuick
import QtQuick.Controls

Item {
    id: control

    anchors.fill: parent

    property color color: AppTheme.theme === 'Dark' ? "#000000" : "#999999"
    property int elevation: 5
    property int radius: 4

    Repeater {
        model: elevation
        Rectangle {
            anchors.fill: parent
            color: "#00000000"
            opacity: 0.01 * (elevation - index + 1)
            anchors.margins: -index
            radius: control.radius + index
            border.width: index
            border.color: control.color
        }
    }
}
