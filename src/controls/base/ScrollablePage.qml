import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Page {
    default property alias content: container.data

    Flickable {
        clip: true
        anchors.fill: parent
        ScrollBar.vertical: BaseControls.ScrollBar {}

        boundsBehavior: Flickable.StopAtBounds
        contentHeight: container.height
        ColumnLayout {
            id: container
            width: parent.width
        }
    }
}
