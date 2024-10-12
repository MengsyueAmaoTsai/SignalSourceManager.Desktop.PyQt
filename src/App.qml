import QtQuick
import QtQuick.Controls
import QtQuick.Window
import Qt.labs.qmlmodels

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

        TableView {
            id: tableView
            width: parent.width
            height: parent.height
            model: TableModel {
                TableModelColumn {
                    display: 'id'
                }
                TableModelColumn {
                    display: 'name'
                }
                TableModelColumn {
                    display: 'description'
                }
                TableModelColumn {
                    display: 'visibility'
                }
                TableModelColumn {
                    display: 'status'
                }
                TableModelColumn {
                    display: 'createdTimeUtc'
                }

                rows: [
                    {
                        id: 1,
                        name: 'Signal Source 1',
                        description: 'Signal Source 1 Description',
                        visibility: 'Public',
                        status: 'Active',
                        createdTimeUtc: '2021-01-01T00:00:00Z'
                    },
                    {
                        id: 2,
                        name: 'Signal Source 2',
                        description: 'Signal Source 2 Description',
                        visibility: 'Private',
                        status: 'Inactive',
                        createdTimeUtc: '2021-01-02T00:00:00Z'
                    },
                    {
                        id: 3,
                        name: 'Signal Source 3',
                        description: 'Signal Source 3 Description',
                        visibility: 'Public',
                        status: 'Active',
                        createdTimeUtc: '2021-01-03T00:00:00Z'
                    },
                    {
                        id: 4,
                        name: 'Signal Source 4',
                        description: 'Signal Source 4 Description',
                        visibility: 'Private',
                        status: 'Inactive',
                        createdTimeUtc: '2021-01-04T00:00:00Z'
                    },
                    {
                        id: 5,
                        name: 'Signal Source 5',
                        description: 'Signal Source 5 Description',
                        visibility: 'Public',
                        status: 'Active',
                        createdTimeUtc: '2021-01-05T00:00:00Z'
                    },
                    {
                        id: 6,
                        name: 'Signal Source 6',
                        description: 'Signal Source 6 Description',
                        visibility: 'Private',
                        status: 'Inactive',
                        createdTimeUtc: '2021-01-06T00:00:00Z'
                    },
                    {
                        id: 7,
                        name: 'Signal Source 7',
                        description: 'Signal Source 7 Description',
                        visibility: 'Public',
                        status: 'Active',
                        createdTimeUtc: '2021-01-07T00:00:00Z'
                    },
                    {
                        id: 8,
                        name: 'Signal Source 8',
                        description: 'Signal Source 8 Description',
                        visibility: 'Private',
                        status: 'Inactive',
                        createdTimeUtc: '2021-01-08T00:00:00Z'
                    },
                    {
                        id: 9,
                        name: 'Signal Source 9',
                        description: 'Signal Source 9 Description',
                        visibility: 'Public',
                        status: 'Active',
                        createdTimeUtc: '2021-01-09T00:00:00Z'
                    },
                    {
                        id: 10,
                        name: 'Signal Source 10',
                        description: 'Signal Source 10 Description',
                        visibility: 'Private',
                        status: 'Inactive',
                        createdTimeUtc: '2021-01-10T00:00:00Z'
                    }
                ]
            }

            delegate: Rectangle {
                border.width: 1

                Text {
                    text: display
                    anchors.centerIn: parent
                }
            }
        }
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
