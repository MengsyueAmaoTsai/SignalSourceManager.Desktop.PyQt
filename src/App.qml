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

    Rectangle {
        id: form

        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            Row {
                Text {
                    text: 'Id'
                }

                TextField {
                    id: idTextBlock
                    text: ''
                }
            }
            Row {
                Text {
                    text: 'Name'
                }

                TextField {
                    id: nameTextBlock
                    text: ''
                }
            }
            Row {
                Text {
                    text: 'Description'
                }

                TextField {
                    id: descriptionTextBlock
                    text: ''
                }
            }
            Row {
                Text {
                    text: 'Visibility'
                }

                ComboBox {
                    id: visibilityCombobox
                    model: ['Public', 'Private']
                }
            }

            Row {
                Button {
                    text: 'Submit'
                    onClicked: {
                        const request = {
                            id: idTextBlock.text,
                            name: nameTextBlock.text,
                            description: descriptionTextBlock.text,
                            visibility: visibilityCombobox.currentText
                        };
                        console.log(request.id, request.name, request.description, request.visibility);
                    }
                }

                Button {
                    text: 'Cancel'
                    onClicked: {
                        idTextBlock.text = '';
                        nameTextBlock.text = '';
                        descriptionTextBlock.text = '';
                        visibilityCombobox.currentIndex = 0;
                        errorPopup.open();
                    }
                }
            }
        }
    }

    Popup {
        id: errorPopup

        anchors.centerIn: parent
        focus: true
        modal: true
        visible: false
        width: 200
        height: 200
        closePolicy: Popup.NoAutoClose

        Rectangle {
            anchors.fill: parent

            ColumnLayout {
                Text {
                    text: 'An error occurred'
                }

                RowLayout {
                    Button {
                        text: 'Close'
                        onClicked: {
                            errorPopup.close();
                        }
                    }
                }
            }
        }
    }
}
