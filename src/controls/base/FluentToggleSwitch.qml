import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Button {
    id: control

    focusPolicy: Qt.TabFocus
    padding: 0
    horizontalPadding: 0

    contentItem: RowLayout {
        FluentTextBlock {}
    }
}
