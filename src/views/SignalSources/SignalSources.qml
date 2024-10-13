import QtQuick
import QtQuick.Controls

Page {
    id: root

    Button {
        id: newSignalSourceButton
        text: 'New signal source'
    }

    TableView {
        id: dataGrid
    }
}
