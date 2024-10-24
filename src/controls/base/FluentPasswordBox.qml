import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

TextField {
    id: control

    font: font_provider.body
    renderType: Text.NativeRendering
    padding: 7
    rightPadding: 40
    leftPadding: padding + 4
    width: 240
}
