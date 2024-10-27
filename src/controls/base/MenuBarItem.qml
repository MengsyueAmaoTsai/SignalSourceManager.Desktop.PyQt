import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import FluentUI

T.MenuBarItem {
    id: control
    contentItem: TextBlock {
        verticalAlignment: Text.AlignVCenter
        text: control.text
        // color: control.textColor
    }
}
