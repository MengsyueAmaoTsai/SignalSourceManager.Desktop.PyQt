import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.Frame {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, contentHeight + topPadding + bottomPadding)
    padding: 0
    background: Rectangle {
        id: context
        radius: 4
        border.color: AppTheme.divider_color
        color: {
            if (Window.active) {
                return AppTheme.frame_active_color;
            }
            return AppTheme.frame_color;
        }
    }

    property alias border: context.border
    property alias color: context.color
    property alias radius: context.radius
}
