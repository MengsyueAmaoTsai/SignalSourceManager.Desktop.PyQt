import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Button {
    id: control

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
        // color: control.textColor
    }

    property string content: 'Fluent Button'
}
