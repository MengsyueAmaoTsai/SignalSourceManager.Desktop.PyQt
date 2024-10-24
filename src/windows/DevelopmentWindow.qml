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

            FluentCombobox {
                id: visibilityCombobox
                // Layout.fillWidth: true
            }
        }

        RowLayout {
            FluentButton {
                content: 'Submit'

                onClicked: {
                    const id = idTextBox.content;
                    const name = nameTextBox.content;
                    const description = descriptionTextBox.content;
                    console.log(`New signal source -> id: ${id}, name: ${name}, description: ${description}`);
                    main_view_model.create_signal_source(id, name, description);
                }
            }

            FluentButton {
                content: 'Cancel'
            }
        }
    }
}
