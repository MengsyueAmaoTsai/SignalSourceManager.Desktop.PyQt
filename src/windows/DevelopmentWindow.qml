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
        FluentTextBox {
            id: idTextBox
        }

        FluentTextBox {
            id: nameTextBox
        }

        FluentTextBox {
            id: descriptionTextBox
        }

        FluentCombobox {
            id: visibilityCombobox
            model: ['Public', 'Protected', 'Internal', 'Private']
            currentIndex: 0
            // Layout.fillWidth: true
        }

        FluentButton {
            content: 'New signal source'

            onClicked: {
                const id = idTextBox.content;
                const name = nameTextBox.content;
                const description = descriptionTextBox.content;
                console.log(`New signal source -> id: ${id}, name: ${name}, description: ${description}`);
                main_view_model.create_signal_source(id, name, description);
            }
        }

        FluentButton {
            content: 'Signal source details'

            onClicked: {
                console.log('Signal source details');
            }
        }
    }
}
