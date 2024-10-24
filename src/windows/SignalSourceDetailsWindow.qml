import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    title: 'Signal source details for '
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    property var signalSource: undefined

    Component.onCompleted: {
        console.log('SignalSourceDetailsWindow created');
    }

    ColumnLayout {
        FluentTextBlock {
            content: 'TV-Long-Task'
        }

        FluentTextBlock {
            content: 'A test signal source'
        }

        FluentButton {
            content: 'Upload historical data'
        }

        RowLayout {
            FluentTabView {}
        }
    }

    FileDialog {
        id: fileDialog

        onAccepted: {
            console.log('Upload file: ', fileDialog.currentFile);
        }
    }
}
