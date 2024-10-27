import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

T.Frame {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, contentHeight + topPadding + bottomPadding)
    padding: 0
    background: Rectangle {
        id: backgroundRectangle
        radius: 4
        border.color: AppTheme.divider_color
        color: Window.active ? AppTheme.frame_active_color : AppTheme.frame_color
    }
    property alias border: backgroundRectangle.border
    property alias color: backgroundRectangle.color
    property alias radius: backgroundRectangle.radius
}
