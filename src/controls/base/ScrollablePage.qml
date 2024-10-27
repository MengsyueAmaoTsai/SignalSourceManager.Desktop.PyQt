import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Page {
    id: control

    default property alias content: container.data

    Flickable {
        clip: true
        anchors.fill: parent
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: BaseControls.ScrollBar {}

        ColumnLayout {
            id: container
            width: parent.width
        }
    }
}
