import QtQuick.Window
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    title: 'Controls'
    height: Screen.height * 0.8
    width: Screen.width * 0.8

    ColumnLayout {
        Layout.fillWidth: true

        // Default button
        RowLayout {
            Layout.fillWidth: true
            Layout.topMargin: 20
            height: 68
            // paddings: 10
            BaseControls.Button {
                text: 'Default'
                onClicked: console.log('Default button clicked')
            }

            BaseControls.ToggleSwitch {
                id: defaultButtonSwitch

                text: 'Disabled'
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }

        // Accent button
        RowLayout {
            Layout.fillWidth: true
            Layout.topMargin: 20
            height: 68
            // paddings: 10
            BaseControls.Button {
                text: 'Accent'
                appearance: 'Accent'
                onClicked: console.log('Accent button clicked')
            }

            BaseControls.ToggleSwitch {
                id: accentButtonSwitch

                text: 'Disabled'
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }

        // Outline button
        RowLayout {
            Layout.fillWidth: true
            Layout.topMargin: 20
            height: 68
            // paddings: 10
            BaseControls.Button {
                text: 'Outline'
                appearance: 'Outline'
                onClicked: console.log('Outline button clicked')
            }

            BaseControls.ToggleSwitch {
                id: outlineButtonSwitch

                text: 'Disabled'
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
            }
        }
    }
}
