import QtQuick
import QtQuick.Controls

Item {
    id: control
    anchors.fill: parent

    property color color: AppTheme.theme === 'Dark' ? '#FFFFFF' : '#999999'
    property int radius: 4
    property int elevation: 6

    Repeater {
        model: control.elevation
        Rectangle {
            anchors.fill: parent
            opacity: 0.01 * (control.elevation - index + 1)
            anchors.margins: -index
            color: "#00000000"
            radius: control.radius + index
            border.width: index
            border.color: control.color
        }
    }
}
