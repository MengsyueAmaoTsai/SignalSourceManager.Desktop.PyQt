import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Item {
    id: control

    property string title: ''
    property url logoSource
    property int topPadding: 0
    property bool hideNavBar: false

    Item {}
    Timer {}
    Connections {}
    // Component {}
    // Component {}
    // Component {}
    // Component {}
    // Component {}
    Item {
        width: parent.width
        height: visible ? 40 : 0
        anchors {
            top: parent.top
            topMargin: control.topPadding
        }
        visible: !control.hideNavBar
        z: 999
        RowLayout {
            height: parent.height
            spacing: 0

            FluentButton {
                id: backButton
                Layout.leftMargin: 5
                Layout.alignment: Qt.AlignVCenter
                // iconSource: FluentIcons.ChromeBack
                // iconSize: 13
                // disabled
                onClicked: {
                    console.log('Back button clicked');
                }
            }
            FluentButton {
                id: menuButton
                // Layout.preferredWidth:
                Layout.preferredHeight: 30
                Layout.alignment: Qt.AlignVCenter
                clip: true
                visible: opacity

                // opacity:
                // iconSource: FluentIcons.GlobalNavButton
                // iconSize: 15

                // Behavior on opacity {
                //     enabled: FluentTheme.animationEnabled && d.animationDisabled
                //     NumericAnimation {
                //         duration: 83
                //     }
                // }
                // Behavior on Layout.preferredWidth {
                //     enabled: FluentTheme.animationEnabled && d.animationDisabled
                //     NumericAnimation {
                //         duration: 167
                //         easing.type: Easing.OutCubic
                //     }
                // }
            }

            Image {
                source: control.logoSource
                sourceSize: Qt.size(40, 40)
                Layout.preferredHeight: 20
                Layout.preferredWidth: 20
                Layout.leftMargin: menuButton.visible ? 12 : 5
                Layout.alignment: Qt.AlignVCenter
                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log('Logo clicked')
                }
            }
            FluentTextBlock {
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 12
                text: control.title
                font: font_provider.body
            }
        }
        Item {
            anchors.right: parent.right
            height: parent.height
            width: {
                if (actionLoader.item) {
                    return actionLoader.item.width;
                }
                return 0;
            }
            ComponentLoader {
                id: actionLoader
                anchors.centerIn: parent
                // sourceComponent: actionItem
            }
        }
    }

    Component {
        id: stackComponent
        Item {
            StackView {
                id: navStack
                anchors.fill: parent
                clip: true
                visible: !navStack2.visible
                popEnter: Transition {}
                popExit: Transition {}
                pushEnter: Transition {}
                pushExit: Transition {}
                replaceEnter: Transition {}
                replaceExit: Transition {}
            }

            StackLayout {
                id: navStack2
                anchors.fill: navStack
                clip: true
                visible: {
                    if (navStack.currentItem) {
                        return false;
                    }
                    return true;
                    // return navStack.currentItem.launchMode === FluentPageType.SingleInstance
                }
            }
        }
    }

    ComponentLoader {
        id: contentLoader
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            // top:
            // leftMargin: {
            //     if (d.isMinimal) {
            //         return 0;
            //     }

            //     if (d.isCompact) {
            //         return control.compactWidth;
            //     }

            //     return control.cellWidth;
            // }
        }
        sourceComponent: stackComponent
        // Behavior on anchors.leftMargin {
        //     enabled: FluentTheme.animationEnabled && d.animationDisabled
        //     NumberAnimation {
        //         duration: 167
        //         easing.type: Easing.OutCubic
        //     }
        // }
    }

    MouseArea {
        anchors.fill: parent
        // visible: d.isMinimalAndPanel || d.isCompactAndPanel
        hoverEnabled: true
        onWheel: console.log('Wheel event')
        onClicked: console.log('MouseArea clicked')
    }
    Rectangle {}
    Popup {}
    ComponentLoader {}
    Connections {}

    Component {
        id: placeholderComponent
        Item {}
    }

    Component.onCompleted: console.log('FluentNavigationView.qml loaded')
}
