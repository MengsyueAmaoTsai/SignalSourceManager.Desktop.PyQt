import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic

TextField {
    id: control

    padding: 7
    leftPadding: padding + 4
    font: font_provider.body
    renderType: Text.NativeRendering
    color: {
        if (!enabled) {
            return disabledColor;
        }
        return defaultColor;
    }
    selectedTextColor: color
    placeholderTextColor: {
        if (!enabled) {
            return placeholderDisabledColor;
        }
        if (focus) {
            return placeholderFocusColor;
        }
        return placeholderDefaultColor;
    }
    selectByMouse: true
    width: 240

    property alias content: control.text
    property color defaultColor: Qt.rgba(255 / 255, 255 / 255, 255 / 255, 1)
    property color disabledColor: Qt.rgba(131 / 255, 131 / 255, 131 / 255, 1)
    property color placeholderDefaultColor: Qt.rgba(210 / 255, 210 / 255, 210 / 255, 1)
    property color placeholderFocusColor: Qt.rgba(152 / 255, 152 / 255, 152 / 255, 1)
    property color placeholderDisabledColor: Qt.rgba(131 / 255, 131 / 255, 131 / 255, 1)

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.IBeamCursor
        acceptedButtons: Qt.RightButton
        onClicked: {
            if (control.echoMode === TextInput.Password) {
                return;
            }
            if (control.readOnly && control.text === '') {
                return;
            }
            console.log('clicked');
        }
    }

    RowLayout {
        height: parent.height
        anchors {
            right: parent.right
            rightMargin: 5
        }
        spacing: 4
    }
}
