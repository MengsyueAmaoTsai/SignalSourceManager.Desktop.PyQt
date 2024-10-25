import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

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

    // readonly property color textColor: AppTheme.font_primary_color

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

        BaseControls.TextBlock {
            text: control.title
            visible: control.titleVisible
            // color: control.textColor
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    RowLayout {
        spacing: 0
        anchors.right: parent.right
        height: parent.height

        BaseControls.Button {
            id: switchThemeButton

            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            text: 'Switch Theme'
            padding: 0

            onClicked: {
                console.warn('Button clicked');
            }
        }
        BaseControls.Button {
            id: stayOnTopButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            text: 'Stay On Top'
            padding: 0

            // verticalPadding: 0
            // horizontalPadding: 0

            onClicked: {
                console.warn('Button clicked');
            }
        }
        BaseControls.Button {
            id: minimizeButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            text: 'Minimize'
            padding: 0

            // verticalPadding: 0
            // horizontalPadding: 0

            onClicked: {
                console.warn('Button clicked');
            }
        }
        BaseControls.Button {
            id: maximizeButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            text: 'Maximize'
            padding: 0

            // verticalPadding: 0
            // horizontalPadding: 0

            onClicked: {
                console.warn('Button clicked');
            }
        }
        BaseControls.Button {
            id: quitButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            text: 'Quit'
            padding: 0
            // verticalPadding: 0
            // horizontalPadding: 0
            onClicked: {
                console.warn('Button clicked');
            }
        }
    }
}
