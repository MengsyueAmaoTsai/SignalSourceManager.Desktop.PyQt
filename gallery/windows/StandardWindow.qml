import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window
    title: "Standard"
    width: 800
    height: 600
    fixSize: true
    launchMode: 'Standard'

    BaseControls.MenuBar {
        BaseControls.Menu {
            title: "File"
            Action {
                text: "New..."
            }
            Action {
                text: "Open..."
            }
            Action {
                text: "Save"
            }
            Action {
                text: "Save A..."
            }
            BaseControls.MenuSeparator {}
            Action {
                text: "Quit"
            }
        }
        BaseControls.Menu {
            title: "Edit"
            Action {
                text: "Cut"
            }
            Action {
                text: "Copy"
            }
            Action {
                text: "Paste"
            }
        }
        BaseControls.Menu {
            title: "Help"
            Action {
                text: "About"
            }
        }
    }

    BaseControls.TextBlock {
        anchors.centerIn: parent
        text: "I' a Standard mode window, and every time I create a new window"
    }
}
