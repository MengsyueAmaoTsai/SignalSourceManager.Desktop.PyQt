import QtQuick
import QtQuick.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

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
        border.color: AppTheme.theme === 'Dark' ? Qt.rgba(1, 1, 1, 1) : Qt.rgba(0, 0, 0, 1)
        z: 65535
    }
}
