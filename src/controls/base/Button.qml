import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Button {
    id: control

    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: '{contentDescription}'
    Accessible.onPressAction: control.clicked()

    font: font_provider.body
    focusPolicy: Qt.TabFocus
    enabled: !disabled
    verticalPadding: 0
    horizontalPadding: 12

    background: Rectangle {
        implicitWidth: 28
        implicitHeight: 28
        radius: 4
        border.width: 1
        border.color: '#505050'
        color: {
            if (!enabled) {
                return disabledColor;
            }
            return hovered ? hoveredColor : defaultColor;
        }

        Rectangle {
            visible: control.activeFocus
            radius: 4
        }
    }

    contentItem: BaseText {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font: control.font
        color: control.textColor
    }

    property bool disabled: false
    property color textColor: {
        if (!enabled) {
            return Qt.rgba(131 / 255, 131 / 255, 131 / 255, 1);
        }
        if (pressed) {
            return Qt.rgba(162 / 255, 162 / 255, 162 / 255, 1);
        }
        return Qt.rgba(1, 1, 1, 1);
    }
    property color defaultColor: Qt.rgba(62 / 255, 62 / 255, 62 / 255, 1)
    property color hoveredColor: Qt.rgba(68 / 255, 68 / 255, 68 / 255, 1)
    property color disabledColor: Qt.rgba(59 / 255, 59 / 255, 59 / 255, 1)
}
