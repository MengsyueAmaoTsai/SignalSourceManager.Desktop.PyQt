import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Button {
    id: control

    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: control.description
    Accessible.onPressAction: control.clicked()

    verticalPadding: 0
    horizontalPadding: 12
    focusPolicy: Qt.TabFocus
    // font
    contentItem: BaseControls.TextBlock {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        // font:
        color: control.textColor
    }

    background: Item {
        id: buttonBackground
        Rectangle {
            id: context
        }
        Rectangle {}
        Rectangle {}
    }

    property string description: ''

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
