import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

TextField {
    id: control

    width: 240
    padding: 7
    leftPadding: padding + 4
    placeholderText: control.placeholder
    font: AppFont.body
    renderType: AppTheme.render_native_text ? Text.NativeRendering : Text.QtRendering
    selectByMouse: true
    // color:
    // enabled:
    // selectionColor:
    // selectedTextColor:
    // placeholderTextColor:
    // rightPadding:
    // background:
    property string placeholder: ''

    RowLayout {
        height: parent.height
        anchors {
            right: parent.right
            rightMargin: 5
        }
        spacing: 4

        BaseControls.Button {
            // iconSource: FluentIcons.Cancel
            // iconSize: 12
            // iconColor: AppTheme.theme === 'Dark' ? Qt.rgba(222/255,222/255,222/255,1) : Qt.rgba(97/255,97/255,97/255,1)
            // verticalPadding: 0
            // horizontalPadding: 0
            // visible:
            // description: 'Clean'
            Layout.preferredWidth: 30
            Layout.preferredHeight: 20
            Layout.alignment: Qt.AlignVCenter
            onClicked: console.log('Clear button clicked')
        }

        // This control will be replace by a FluentIcon
        Item {
            // iconSource:
            // iconSize: 12
            // iconColor: AppTheme.theme === 'Dark' ? Qt.rgba(222/255,222/255,222/255,1) : Qt.rgba(97/255,97/255,97/255,1)
            // visible:
            Layout.alignment: Qt.AlignVCenter
            Layout.rightMargin: 7
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.IBeamCursor
        acceptedButtons: Qt.RightButton
        onClicked: {
            console.log('TextBox mouse area clicked');
        }
    }
    Keys.onEnterPressed: event => console.log('Enter pressed')
    Keys.onReturnPressed: event => console.log('Return pressed')
}
