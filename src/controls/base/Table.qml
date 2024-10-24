import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels

Rectangle {
    id: control

    color: Qt.rgba(39 / 255, 39 / 255, 39 / 255, 1)

    property bool horizontalHeaderVisible: true
    property bool verticalHeaderVisible: true
    property color borderColor: '#252525'

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
