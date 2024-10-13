import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    implicitHeight: 44
    implicitWidth: context.widthOpened

    required property string text
    required property string icon

    Pane {
        id: container
        anchors.fill: parent
        padding: 0
        background: Rectangle {
            color: '#000000'
            radius: 4
        }

        RowLayout {
            id: layout
            height: parent.height
            spacing: 0

            Rectangle {
                id: iconContainer
                color: 'transparent'
                radius: 4
                Layout.preferredWidth: 52
                Layout.preferredHeight: 44

                Image {
                    id: icon
                    source: root.icon
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    antialiasing: false
                    sourceSize.width: 30
                    sourceSize.height: 28
                }
            }

            Label {
                id: label
                text: root.text
                font.weight: 400
                font.pointSize: 13
                color: '#CACACF'
                Layout.leftMargin: 10
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: console.log('Open page')
    }

    QtObject {
        id: context
        property int widthOpened: 177
        property int widthClosed: 52
    }
}
