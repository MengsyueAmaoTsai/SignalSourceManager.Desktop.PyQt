import QtQuick
import QtQuick.Controls

import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt.labs.qmlmodels
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

ApplicationWindow {
    id: app

    title: 'RichillCapital.SignalSourceManager.Desktop'
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    RowLayout {
        BaseControls.Button {
            text: 'New signal source'
            onClicked: newSignalSourcePopup.open()
        }

        BaseControls.Button {
            text: 'Upload historical data'
            onClicked: fileDialog.open()
        }
    }

    BaseControls.Popup {
        id: newSignalSourcePopup

        ColumnLayout {
            RowLayout {
                BaseControls.TextBlock {
                    text: 'Id'
                }
                BaseControls.TextBox {
                    id: idTextBox
                    placeholderText: 'Enter id'
                }
            }
            RowLayout {
                BaseControls.TextBlock {
                    text: 'Name'
                }
                BaseControls.TextBox {
                    id: nameTextBox
                    placeholderText: 'Enter name'
                }
            }

            RowLayout {
                BaseControls.TextBlock {
                    text: 'Description'
                }
                BaseControls.TextBox {
                    id: descriptionTextBox
                    placeholderText: 'Enter description'
                }
            }

            RowLayout {
                BaseControls.TextBlock {
                    text: 'Visibility'
                }
                BaseControls.ComboBox {}
            }

            RowLayout {
                BaseControls.Button {
                    text: 'Submit'
                    onClicked: {
                        const id = idTextBox.text;
                        const name = nameTextBox.text;
                        const description = descriptionTextBox.text;
                        console.log(`Id: ${id}, Name: ${name}, Description: ${description}`);
                        newSignalSourcePopup.close();
                    }
                }

                BaseControls.Button {
                    text: 'Cancel'
                    onClicked: {
                        idTextBox.text = '';
                        nameTextBox.text = '';
                        descriptionTextBox.text = '';
                        newSignalSourcePopup.close();
                    }
                }
            }
        }
    }

    FileDialog {
        id: fileDialog

        fileMode: FileDialog.OpenFile

        onAccepted: {
            const filePath = context.getAbsolutePath(fileDialog.file);
            console.log(`Upload historical data => ${filePath}`);
        }
    }

    QtObject {
        id: context

        function getAbsolutePath(url) {
            return url.toString().replace("file:///", "");
        }
    }

    Component.onCompleted: {
        console.log('Application started');
        MainViewModel.on_application_started();
    }
}
