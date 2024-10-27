import QtQuick

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

MenuBar {
    id: control
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, contentHeight + topPadding + bottomPadding)
    delegate: BaseControls.MenuBarItem {}

    contentItem: Row {
        spacing: control.spacing
        Repeater {
            model: control.contentModel
        }
    }
    background: Item {
        implicitHeight: 30
    }
}
