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
        // color:
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
}
