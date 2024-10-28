import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Basic
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

TextField {
    id: control
    signal commit(string text)
    property bool disabled: false
    property int iconSource: 0
    property color normalColor: AppTheme.theme === 'Dark' ? Qt.rgba(255 / 255, 255 / 255, 255 / 255, 1) : Qt.rgba(27 / 255, 27 / 255, 27 / 255, 1)
    property color disableColor: AppTheme.theme === 'Dark' ? Qt.rgba(131 / 255, 131 / 255, 131 / 255, 1) : Qt.rgba(160 / 255, 160 / 255, 160 / 255, 1)
    property bool cleanEnabled: true

    padding: 7
    leftPadding: padding + 4
    enabled: !disabled
    color: {
        if (!enabled) {
            return disableColor;
        }
        return normalColor;
    }
    font: AppFont.body
    renderType: AppTheme.render_native_text ? Text.NativeRendering : Text.QtRendering
    // selectionColor: FluTools.withOpacity(AppTheme.primary_color, 0.5)
    selectedTextColor: color
    placeholderTextColor: {
        if (!enabled) {
            return disableColor;
        }
        if (focus) {
            return placeholderFocusColor;
        }
        return normalColor;
    }
    selectByMouse: true
    rightPadding: {
        var w = 30;
        if (control.cleanEnabled === false) {
            w = 0;
        }
        if (control.readOnly)
            w = 0;
        return icon_end.visible ? w + 36 : w + 10;
    }
    width: 240
    // background: FluTextBoxBackground {
    //     inputItem: control
    // }
    Keys.onEnterPressed: event => d.handleCommit(event)
    Keys.onReturnPressed: event => d.handleCommit(event)
    QtObject {
        id: d
        function handleCommit(event) {
            control.commit(control.text);
        }
    }
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.IBeamCursor
        acceptedButtons: Qt.RightButton
        onClicked: {
            if (control.echoMode === TextInput.Password) {
                return;
            }
            if (control.readOnly && control.text === "") {
                return;
            }
            menu_loader.popup();
        }
    }
    RowLayout {
        height: parent.height
        anchors {
            right: parent.right
            rightMargin: 5
        }
        spacing: 4
        // FluIconButton {
        //     iconSource: FluentIcons.Cancel
        //     iconSize: 12
        //     Layout.preferredWidth: 30
        //     Layout.preferredHeight: 20
        //     Layout.alignment: Qt.AlignVCenter
        //     iconColor: AppTheme.theme === 'Dark' ? Qt.rgba(222 / 255, 222 / 255, 222 / 255, 1) : Qt.rgba(97 / 255, 97 / 255, 97 / 255, 1)
        //                                verticalPadding: 0
        //     horizontalPadding: 0
        //     visible: {
        //         if (control.cleanEnabled === false) {
        //             return false;
        //         }
        //         if (control.readOnly)
        //             return false;
        //         return control.text !== "";
        //     }
        //     contentDescription: "Clean"
        //     onClicked: {
        //         control.clear();
        //     }
        // }
        BaseControls.Icon {
            id: icon_end
            iconSource: control.iconSource
            iconSize: 12
            Layout.alignment: Qt.AlignVCenter
            Layout.rightMargin: 7
            iconColor: AppTheme.theme === 'Dark' ? Qt.rgba(222 / 255, 222 / 255, 222 / 255, 1) : Qt.rgba(97 / 255, 97 / 255, 97 / 255, 1)
            visible: control.iconSource != 0
        }
    }
    BaseControls.ComponentLoader {
        id: menu_loader
        function popup() {
            sourceComponent = menu;
        }
    }
    Component {
        id: menu
        Item {}
        // FluTextBoxMenu {
        //     inputItem: control
        //     Component.onCompleted: {
        //         popup();
        //     }
        //     onClosed: {
        //         menu_loader.sourceComponent = undefined;
        //     }
        // }
    }
}
