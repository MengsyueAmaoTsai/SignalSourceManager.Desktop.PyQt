import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt.labs.qmlmodels

Rectangle {
    id: self

    //#region Fluent properties
    property var items: []

    //#endregion

    Component.onCompleted: {
        console.log(`Item count: ${self.items.length}`);
    }
}
