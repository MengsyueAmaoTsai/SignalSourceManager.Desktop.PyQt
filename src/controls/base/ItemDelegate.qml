import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Templates as T
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

T.ItemDelegate {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding, implicitIndicatorHeight + topPadding + bottomPadding)
    padding: 0
    verticalPadding: 8
    horizontalPadding: 10
    icon.color: control.palette.text
    contentItem: BaseControls.TextBlock {
        text: control.text
        font: control.font
        color: {
            if (control.down) {
                return AppTheme.theme === 'Dark' ? FluColors.Grey80 : FluColors.Grey120;
            }
            return AppTheme.theme === 'Dark' ? FluColors.White : FluColors.Grey220;
        }
    }
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 30
        color: {
            if (AppTheme.theme === 'Dark') {
                return Qt.rgba(1, 1, 1, 0.05);
            } else {
                return Qt.rgba(0, 0, 0, 0.05);
            }
        }
        visible: control.down || control.highlighted || control.visualFocus
    }
}
