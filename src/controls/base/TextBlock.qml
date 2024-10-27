import QtQuick
import QtQuick.Controls

Text {
    id: control

    renderType: AppTheme.render_native_text ? Text.NativeRendering : Text.QtRendering
    font: AppFont.body
    color: textColor

    property color textColor: AppTheme.font_primary_color
    property string typo: ''
}
