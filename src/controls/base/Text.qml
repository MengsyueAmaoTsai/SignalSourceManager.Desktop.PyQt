import QtQuick
import QtQuick.Controls

Text {
    id: control

    color: textColor
    renderType: Text.NativeRendering
    font: font_provider.body

    property color textColor: color_provider.font_primary_color
}
