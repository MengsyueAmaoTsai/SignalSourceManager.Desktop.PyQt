import QtQuick
import QtQuick.Controls

Button {
    id: control

    property bool disabled: false
    property string contentDescription: ''

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

    enabled: !disabled
    verticalPadding: 0
    horizontalPadding: 12
    focusPolicy: Qt.TabFocus

    contentItem: RCText {
        text: control.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font: control.font
        // color: control.textColor
    }

    Accessible.role: Accessible.Button
    Accessible.name: control.text
    Accessible.description: control.contentDescription
    Accessible.onPressAction: control.clicked()
}
