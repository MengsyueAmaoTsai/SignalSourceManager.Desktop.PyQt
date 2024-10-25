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

    readonly property bool showSwitchThemeButton: true
    readonly property bool showStayOnTopButton: true
    readonly property bool showMinimizeButton: true
    readonly property bool showMaximizeButton: true
    readonly property bool showCloseButton: true

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
            padding: 0
            // verticalPadding: 0
            // horizontalPadding: 0
            // radius: 0
            visible: showSwitchThemeButton
            // text: FluTheme.dark ? 'Light' : 'Dark
            // color
            // iconColor
            // iconSize: 10
            // iconSource
            onClicked: {
                console.warn('Button clicked');
            }
        }
        BaseControls.Button {
            id: stayOnTopButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            padding: 0

            // verticalPadding: 0
            // horizontalPadding: 0
            // radius: 0
            // visible: {
            //     if (!(context.win instanceof FluWindow)) {
            //         return false;
            //     }
            //     return showStayOnTopButton;
            // }
            // text: context.stayOnTop ? 'Sticky on Top cancelled' : 'Sticky on Top'
            // color
            // iconColor
            // iconSize: 10
            // iconSource
            onClicked: {
                console.warn('Button clicked');
            }
        }
        BaseControls.Button {
            id: minimizeButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            padding: 0
            // verticalPadding: 0
            // horizontalPadding: 0
            // radius: 0
            visible: showMinimizeButton
            text: 'Minimize'

            // color
            // iconColor
            // iconSize: 10
            // iconSource
            onClicked: {
                console.warn('Button clicked');
            }
        }
        BaseControls.Button {
            id: maximizeButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            padding: 0

            // verticalPadding: 0
            // horizontalPadding: 0
            // radius: 0
            visible: showMaximizeButton // && context.resizable
            // text: context.isRestore ? 'Restore' : 'Maximize'
            text: 'Maximize'
            // color
            // iconColor
            // iconSize: 10
            // iconSource
            onClicked: {
                console.warn('Button clicked');
            }
        }
        BaseControls.Button {
            id: quitButton
            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            padding: 0
            // verticalPadding: 0
            // horizontalPadding: 0
            // radius: 0
            visible: showCloseButton
            text: 'Close'

            // color
            // iconColor
            // iconSize: 10
            // iconSource
            onClicked: {
                console.warn('Button clicked');
            }
        }
    }
}
