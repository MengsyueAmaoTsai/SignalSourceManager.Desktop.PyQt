import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: root
    title: 'RichillCapital.SignalSourceManager.Desktop'
    visible: true
    width: Screen.width * .8
    height: Screen.height * .8

    menuBar: MenuBar {
        Menu {
            title: 'File'

            MenuItem {
                text: 'About'
                onTriggered: aboutDialog.open()
            }

            MenuItem {
                text: 'Exit'
                onTriggered: Qt.quit()
            }
        }
    }

    Rectangle {
        id: mainContainer
        anchors.fill: parent
        color: 'lightgray'
    }

    Component.onCompleted: mainViewModel.load_data()

    Dialog {
        id: aboutDialog
        title: 'About'
        modal: true
        standardButtons: Dialog.Ok
        anchors.centerIn: parent

        Column {
            spacing: 10
            padding: 20

            Text {
                text: 'Python version: ' + mainViewModel.python_version
            }
            Text {
                text: 'Qt version: ' + mainViewModel.qt_version
            }
        }
    }
}
