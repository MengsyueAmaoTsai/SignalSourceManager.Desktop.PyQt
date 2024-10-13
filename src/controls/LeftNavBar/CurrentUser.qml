import QtQuick

import QtQuick.Controls

import QtQuick.Layouts

Item {
    id: root

    implicitWidth: 72

    implicitHeight: 60

    Pane {
        id: container

        padding: 0

        anchors.fill: parent

        background: Rectangle {

            color: '#000000'
        }

        RowLayout {
            width: 72
            height: parent.height
            spacing: 0

            Rectangle {
                antialiasing: true
                radius: width
                clip: true

                Layout.preferredWidth: 36
                Layout.preferredHeight: 36
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 18

                Label {
                    id: username

                    text: 'Mengsyue Amao Tsai'

                    color: '#FFFFFF'

                    font.bold: true

                    font.pointSize: 12

                    anchors.centerIn: parent
                }

                Image {
                    id: avatar

                    anchors.centerIn: parent

                    sourceSize.height: parent.height

                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        cursorShape: Qt.PointingHandCursor

        onClicked: {
            console.log('Clicked');
        }
    }
}
