import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Rectangle {
    id: control

    color: Qt.rgba(39 / 255, 39 / 255, 39 / 255, 1)

    property bool horizontalHeaderVisible: true
    property bool verticalHeaderVisible: true
    property color borderColor: '#252525'

    property alias model: tableModel

    property var columnSource: []
    property var itemSource: []

    Component.onCompleted: {
        console.log("BaseTable loaded");
        console.log('Column source: ', columnSource.length);
        console.log('Item source: ', itemSource.length);
    }

    TableModel {
        id: tableModel
    }

    TableView {
        id: horizontalHeader

        model: TableModel {}

        visible: control.horizontalHeaderVisible
        anchors.top: parent.top
        clip: true

        delegate: Rectangle {
            color: Qt.rgba(50 / 255, 50 / 255, 50 / 255, 1)
            implicitWidth: (columnComponentLoader.item && columnComponentLoader.item.implicitWidth) + (cellPadding * 2)
            implicitHeight: Math.max(columnComponentLoader.item && columnComponentLoader.item.implicitHeight) + (cellPadding * 2)

            readonly property real cellPadding: 8

            Rectangle {
                border.color: control.borderColor
                width: parent.width
                height: 1
                anchors.top: parent.top
                color: "#00000000"
            }
            Rectangle {
                border.color: control.borderColor
                width: parent.width
                height: 1
                anchors.top: parent.bottom
                color: "#00000000"
            }
            Rectangle {
                border.color: control.borderColor
                width: parent.width
                height: 1
                anchors.top: parent.left
                color: "#00000000"
            }
            Rectangle {
                border.color: control.borderColor
                width: parent.width
                height: 1
                anchors.top: parent.right
                color: "#00000000"
                visible: column === tableModel.columnCount - 1
            }

            ComponentLoader {
                id: columnComponentLoader

                width: parent.width
                height: parent.height
                sourceComponent: defaultTextColumn
            }

            MouseArea {
                anchors.fill: parent
                anchors.rightMargin: 6
                hoverEnabled: true
                onCanceled: {
                    console.log('Canceled');
                }

                onContainsMouseChanged: {
                    console.log('Contains mouse changed');
                }

                onClicked: {
                    console.log('Clicked');
                }
            }

            MouseArea {
                height: parent.height
                width: 6
                anchors.right: parent.right
                acceptedButtons: Qt.LeftButton
                hoverEnabled: true
                cursorShape: Qt.SplitHCursor

                onPressed: mouse => {
                    console.log(mouse, 'pressed');
                }

                onReleased: {
                    console.log('Released');
                }

                onCanceled: {
                    console.log('Canceled');
                }

                onPositionChanged: {
                    console.log('Position changed');
                }
            }
        }
    }

    TableView {
        id: verticalHeader

        visible: control.verticalHeaderVisible
        anchors.left: parent.left
        clip: true
        model: TableModel {
            TableModelColumn {}
            rows: {
                if (itemSource) {
                    return itemSource;
                }
                return [];
            }
        }

        delegate: Rectangle {
            color: Qt.rgba(50 / 255, 50 / 255, 50 / 255, 1)

            Rectangle {
                border.color: control.borderColor
                width: parent.width
                height: 1
                anchors.top: parent.top
                color: "#00000000"
            }
            Rectangle {
                border.color: control.borderColor
                width: parent.width
                height: 1
                anchors.bottom: parent.bottom
                visible: row === tableModel.rowCount - 1
                color: "#00000000"
            }
            Rectangle {
                border.color: control.borderColor
                width: 1
                height: parent.height
                anchors.left: parent.left
                color: "#00000000"
            }
            Rectangle {
                border.color: control.borderColor
                width: 1
                height: parent.height
                anchors.right: parent.right
                color: "#00000000"
            }

            BaseText {
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                anchors.bottomMargin: 6
                hoverEnabled: true
                onCanceled: {
                    console.log('Canceled');
                }

                onContainsMouseChanged: {
                    console.log('Contains mouse changed');
                }

                onClicked: {
                    console.log('Clicked');
                }
            }

            MouseArea {}
        }
    }

    //#region Default components
    Component {
        id: defaultTextColumn

        BaseText {
            text: 'TEXT COLUMN'
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    //#endregion

    //#region Functions

    function closeEditor() {
        throw new Error('Not implemented closeEditor()');
    }

    function resetPosition() {
        throw new Error('Not implemented resetPosition()');
    }

    function customItem(componentId, options = {}) {
        throw new Error('Not implemented customItem()');
    }

    function updateRow(row, obj) {
        throw new Error('Not implemented updateRow()');
    }

    function sort(order) {
        throw new Error('Not implemented sort()');
    }

    //#endregion
}
