import QtQuick

Text {
    id: control

    property color textColor: Qt.rgba(248, 248, 248, 255)

    // color: textColor
    renderType: Text.NativeRendering
    font.pixelSize: 13
    font.family: 'Microsoft JhengHei UI'
}
