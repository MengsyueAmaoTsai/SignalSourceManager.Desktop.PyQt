import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    id: root

    background: Rectangle {
        anchors.fill: parent
        color: '#000000'
    }

    ColumnLayout {
        Label {
            text: 'Current version: ' + mainViewModel.application_version
        }

        Label {
            text: 'Python version: ' + mainViewModel.python_version
        }

        Label {
            text: 'QT version: ' + mainViewModel.qt_version
        }
    }
}
