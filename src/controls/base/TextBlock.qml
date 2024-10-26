import QtQuick
import QtQuick.Controls

Text {
    id: control

    renderType: AppTheme.render_native_text ? Text.NativeRendering : Text.QtRendering
    color: textColor

    // font:
    property color textColor: AppTheme.font_primary_color
}
