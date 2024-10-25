import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Rectangle {
    id: control

    color: Qt.rgba(0, 0, 0, 0)
    height: visible ? 30 : 0
    opacity: visible
    z: 65535

    required property string title
    readonly property bool titleVisible: true

    required property url iconSource
    readonly property int iconSize: 20

    readonly property color textColor: AppColors.font_primary_color

    Item {
        id: context
    }

    Row {
        anchors {
            left: parent.left
            leftMargin: 10
            verticalCenter: parent.verticalCenter
            horizontalCenter: undefined
        }
        spacing: 10

        Image {
            visible: status === Image.Ready
            anchors.verticalCenter: parent.verticalCenter
            height: control.iconSize
            width: control.iconSize
            source: control.iconSource
        }

        Text {
            text: control.title
            visible: control.titleVisible
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    RowLayout {}
}
