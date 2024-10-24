import QtQuick

Text {
    id: control

    text: content
    font: font_provider.body
    renderType: Text.NativeRendering
    color: textColor

    property string content: 'Fluent TextBlock'
    property color textColor: color_provider.font_primary_color
}
