import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Rectangle {
    id: control

    color: Qt.rgba(0, 0, 0, 0)
    height: visible ? 30 : 0
    opacity: visible
    z: 65535

    Item {
        id: dataContext
    }

    Row {
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: undefined
            left: parent.left
            leftMargin: 10
        }
        spacing: 10
        Image {
            anchors.verticalCenter: parent.verticalCenter
            visible: status === Image.Ready
        }

        FluentTextBlock {
            id: title
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    RowLayout {
        height: parent.height
        anchors.right: parent.right
        spacing: 0

        FluentButton {
            id: switchThemeButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            padding: 0
            rightPadding: 2
            // radius: 0
            // veticalPadding: 0
            // horizontalPadding: 0
            // iconSource:
            // iconSize:
            // text:
            // iconColor: control.textColor
            onClicked: console.glo('Switch theme button clicked')
        }
        FluentButton {
            id: stayOnTopButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            padding: 0
            // radius:
            // verticalPadding: 0
            // horizontalPadding: 0
            // iconSource : FluentIcons.Pinned
            // iconSize: 14
            // iconColor:
            // visible:
            // text
            onClicked: console.log('Stay on top button clicked')
        }

        FluentButton {
            id: minimizeButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            onClicked: console.log('Minimize button clicked')
        }

        FluentButton {
            id: maximizeButton
            onClicked: console.log('Maximize button clicked')
        }

        FluentButton {
            id: quitButton

            onClicked: console.log('Quit button clicked')
        }
    }
}
