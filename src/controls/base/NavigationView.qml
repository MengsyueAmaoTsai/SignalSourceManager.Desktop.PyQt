import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Item {
    id: control

    Item {
        width: parent.width
        height: visible ? 40 : 0
        anchors {
            top: parent.top
            topMargin: control.topPadding
        }
        z: 999
        // visible
        RowLayout {
            height: parent.height
            spacing: 0

            BaseControls.Button {
                id: backButton

                onClicked: {
                    console.log('TODO: Implement NavigationView.qml backButton.onClicked');
                }
            }
            BaseControls.Button {}
            Image {}
            BaseControls.TextBlock {
                text: 'control.title'
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 12
                font: AppFont.body
            }
        }
        Item {
            anchors.right: parent.right
            height: parent.height
            // width: {
            //     if(loader_action.item){
            //         return loader_action.item.width
            //     }
            //     return 0
            // }
            BaseControls.ComponentLoader {
                id: actionLoader
                anchors.centerIn: parent
                // sourceComponent: control.actionWrapper
            }
        }
    }

    Component.onCompleted: console.log('TODO: Implement NavigationView.qml Component.onCompleted')
}
