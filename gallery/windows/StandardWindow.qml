import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window
    title: "Standard"
    width: 500
    height: 600
    fixSize: true
    launchMode: 'Standard'

    BaseControls.MenuBar {
        BaseControls.Menu {
            title: qsTr("File")
            Action {
                text: qsTr("New...")
            }
            Action {
                text: qsTr("Open...")
            }
            Action {
                text: qsTr("Save")
            }
            Action {
                text: qsTr("Save As...")
            }
            BaseControls.MenuSeparator {}
            Action {
                text: qsTr("Quit")
            }
        }
        BaseControls.Menu {
            title: qsTr("Edit")
            Action {
                text: qsTr("Cut")
            }
            Action {
                text: qsTr("Copy")
            }
            Action {
                text: qsTr("Paste")
            }
        }
        BaseControls.Menu {
            title: qsTr("Help")
            Action {
                text: qsTr("About")
            }
        }
    }

    BaseControls.TextBlock {
        anchors.centerIn: parent
        text: qsTr("I'm a Standard mode window, and every time I create a new window")
    }
}
