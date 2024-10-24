import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Button {
    id: control

    Accessible.role: Accessible.Button
    Accessible.name: control.content
    Accessible.description: control.content
    Accessible.onPressAction: control.clicked()

    text: content
    font: font_provider.body
    focusPolicy: Qt.TabFocus
    verticalPadding: 0
    horizontalPadding: 12

    contentItem: FluentTextBlock {
        content: control.content
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        font: control.font
        color: control.textColor
    }
    background: Item {}

    property string content: 'Fluent Button'

    property color defaultColor: Qt.rgba(62 / 255, 62 / 255, 62 / 255, 1)
    property color hoverColor: Qt.rgba(68 / 255, 68 / 255, 68 / 255, 1)
    property color disableColor: Qt.rgba(59 / 255, 59 / 255, 59 / 255, 1)
    property color dividerColor: Qt.rgba(80 / 255, 80 / 255, 80 / 255, 1)
    property color textColor: {
        if (!enabled) {
            return Qt.rgba(131 / 255, 131 / 255, 131 / 255, 1);
        }
        if (pressed) {
            return Qt.rgba(162 / 255, 162 / 255, 162 / 255, 1);
        }
        return Qt.rgba(1, 1, 1, 1);
    }
}
