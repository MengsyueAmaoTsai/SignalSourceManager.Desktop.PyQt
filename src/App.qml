import QtQuick
import QtQuick.Controls

import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt.labs.qmlmodels

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

ApplicationWindow {
    id: app

    title: 'RichillCapital.SignalSourceManager.Desktop'
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    ColumnLayout {
        anchors.fill: parent
        Button {
            id: newSignalSourceButton
            text: 'New signal source'
            onClicked: {
                newSignalSourceDialog.open();
            }
        }

        TableView {
            id: table
            width: parent.width
            anchors {
                top: newSignalSourceButton.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            clip: true
            rowSpacing: 1
            columnSpacing: 1

            model: TableModel {
                id: tableModel
                TableModelColumn {
                    display: 'id'
                }
                TableModelColumn {
                    display: 'name'
                }
                TableModelColumn {
                    display: 'description'
                }
                TableModelColumn {
                    display: 'visible'
                }
                TableModelColumn {
                    display: 'createdTimeUtc'
                }

                rows: [
                    {
                        id: '1',
                        name: 'Signal source 1',
                        description: 'Signal source 1 description',
                        visible: 'Public',
                        createdTimeUtc: '2021-01-01 00:00:00'
                    }
                ]
            }
            delegate: Rectangle {
                implicitWidth: 100
                implicitHeight: 50
                border.width: 1

                Text {
                    text: display
                    anchors.centerIn: parent
                }
            }
        }
    }

    Popup {
        id: newSignalSourceDialog

        anchors.centerIn: parent
        focus: true
        closePolicy: Popup.NoAutoClose

        ColumnLayout {
            RowLayout {
                Text {
                    text: 'Id'
                }
                TextField {
                    placeholderText: 'Unique signal source id'
                }
            }
            RowLayout {
                Text {
                    text: 'Name'
                }
                TextField {
                    placeholderText: ''
                }
            }
            RowLayout {
                Text {
                    text: 'Description'
                }
                TextField {
                    placeholderText: 'Unique signal source id'
                }
            }
            RowLayout {
                Text {
                    text: 'Visibility'
                }
                ComboBox {
                    model: ['Public', 'Protected', 'Internal', 'Private']
                }
            }
            RowLayout {
                Button {
                    text: 'Submit'
                    onClicked: {
                        console.log('Submit');
                    }
                }

                Button {
                    text: 'Cancel'
                    onClicked: {
                        newSignalSourceDialog.close();
                    }
                }
            }
        }
    }
}
