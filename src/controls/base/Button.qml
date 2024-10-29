import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Button {
    id: control

    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: contentDescription
    Accessible.onPressAction: control.clicked()
    enabled: !disabled
    verticalPadding: 0
    horizontalPadding: 12
    font: AppFont.body
    focusPolicy: Qt.TabFocus
    background: BaseControls.Background {
        implicitWidth: 30
        implicitHeight: 30
        radius: 4
        color: {
            if (!enabled) {
                return disableColor;
            }
            return hovered ? hoverColor : normalColor;
        }
        shadow: !pressed && enabled
        BaseControls.FocusRectangle {
            visible: control.activeFocus
            radius: 4
        }
    }
    contentItem: BaseControls.TextBlock {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font: control.font
        color: control.textColor
    }

    property string appearance: 'Basic'
    property bool loading: false
    property color backgroundColor
    property string iconStart: ''
    property string iconEnd: ''
    property int iconSize: 0

    property bool disabled: false
    property string contentDescription: ""
    property color normalColor: AppTheme.theme === 'Dark' ? Qt.rgba(62 / 255, 62 / 255, 62 / 255, 1) : Qt.rgba(254 / 255, 254 / 255, 254 / 255, 1)
    property color hoverColor: AppTheme.theme === 'Dark' ? Qt.rgba(68 / 255, 68 / 255, 68 / 255, 1) : Qt.rgba(246 / 255, 246 / 255, 246 / 255, 1)
    property color disableColor: AppTheme.theme === 'Dark' ? Qt.rgba(59 / 255, 59 / 255, 59 / 255, 1) : Qt.rgba(251 / 255, 251 / 255, 251 / 255, 1)
    property color dividerColor: AppTheme.theme === 'Dark' ? Qt.rgba(80 / 255, 80 / 255, 80 / 255, 1) : Qt.rgba(233 / 255, 233 / 255, 233 / 255, 1)
    property color textColor: {
        if (AppTheme.theme === 'Dark') {
            if (!enabled) {
                return Qt.rgba(131 / 255, 131 / 255, 131 / 255, 1);
            }
            if (pressed) {
                return Qt.rgba(162 / 255, 162 / 255, 162 / 255, 1);
            }
            return Qt.rgba(1, 1, 1, 1);
        } else {
            if (!enabled) {
                return Qt.rgba(160 / 255, 160 / 255, 160 / 255, 1);
            }
            if (pressed) {
                return Qt.rgba(96 / 255, 96 / 255, 96 / 255, 1);
            }
            return Qt.rgba(0, 0, 0, 1);
        }
    }
}
