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
                text: 'Exit'
                onTriggered: Qt.quit()
            }
        }
    }

    Rectangle {
        id: mainContainer
        anchors.fill: parent
        color: 'lightgray'

        Column {
            anchors.centerIn: parent
            spacing: 10

            Button {
                text: 'Click me'
                onClicked: console.log('Hello, World!')
            }
        }
    }
}
