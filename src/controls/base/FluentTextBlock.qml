import QtQuick
import QtQuick.Controls

Text {
    id: control

    text: content
    font: font_provider.body
    renderType: Text.NativeRendering

    property string content: 'Fluent TextBlock'
}
