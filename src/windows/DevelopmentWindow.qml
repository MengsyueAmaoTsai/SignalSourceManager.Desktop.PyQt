import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
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
            onClicked: newSignalSourceDialog.open()
        }
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

                FluentTextBox {}
            }

            RowLayout {
                FluentTextBlock {
                    content: 'Name'
                }

                FluentTextBox {}
            }
            RowLayout {
                FluentTextBlock {
                    content: 'Description'
                }

                FluentTextBox {}
            }

            RowLayout {
                FluentTextBlock {
                    content: 'Visibility'
                }

                FluentCombobox {
                    model: ListModel {
                        ListElement {
                            text: 'Public'
                        }
                        ListElement {
                            text: 'Protected'
                        }
                        ListElement {
                            text: 'Internal'
                        }
                        ListElement {
                            text: 'Private'
                        }
                    }
                }
            }

            RowLayout {
                FluentButton {
                    content: 'Submit'
                    onClicked: {
                        console.log('Submit');
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
