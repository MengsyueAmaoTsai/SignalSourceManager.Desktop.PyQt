import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

T.ToolTip {
    id: control
    x: parent ? (parent.width - implicitWidth) / 2 : 0
    y: -implicitHeight - 3
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, contentHeight + topPadding + bottomPadding)
    margins: 6
    padding: 6
    font: AppFont.body
    closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent | T.Popup.CloseOnReleaseOutsideParent
    contentItem: BaseControls.TextBlock {
        text: control.text
        font: control.font
        wrapMode: Text.Wrap
    }
    background: Rectangle {
        color: AppTheme.theme === 'Dark' ? Qt.rgba(50 / 255, 49 / 255, 48 / 255, 1) : Qt.rgba(1, 1, 1, 1)
        radius: 3
        BaseControls.Shadow {
            radius: 3
        }
    }
}
