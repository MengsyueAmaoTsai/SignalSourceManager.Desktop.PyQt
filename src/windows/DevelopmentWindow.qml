import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window

    title: 'Development'
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    RowLayout {
        FluentButton {
            id: newSignalSourceButton
            content: 'New signal source'
            onClicked: uploadHistoricalDataDialog.open()
        }
    }

    UploadHistoricalDataDialog {
        id: uploadHistoricalDataDialog
    }

    Popup {
        id: newSignalSourceDialog

        width: Screen.width * 0.4
        height: Screen.height * 0.4

        modal: true
        focus: true
        closePolicy: Popup.NoAutoClose | Popup.CloseOnEscape

        ColumnLayout {
            RowLayout {
                FluentTextBlock {
                    content: 'Id'
                }

                FluentTextBox {
                    id: idTextBox
                }
            }

            RowLayout {
                FluentTextBlock {
                    content: 'Name'
                }

                FluentTextBox {
                    id: nameTextBox
                }
            }
            RowLayout {
                FluentTextBlock {
                    content: 'Description'
                }

                FluentTextBox {
                    id: descriptionTextBox
                }
            }

            RowLayout {
                FluentTextBlock {
                    content: 'Visibility'
                }

                FluentCombobox {}
            }

            RowLayout {
                FluentButton {
                    content: 'Submit'

                    onClicked: {
                        // Do client-side validation
                        const id = idTextBox.content;
                        const name = nameTextBox.content;
                        const description = descriptionTextBox.content;
                        console.log(`Submit. Id: ${id}, Name: ${name}, Description: ${description}`);

                        // Send the request to the server
                        newSignalSourceDialog.close();
                    }
                }

                FluentButton {
                    content: 'Cancel'
                    onClicked: newSignalSourceDialog.close()
                }
            }
        }
    }
}
