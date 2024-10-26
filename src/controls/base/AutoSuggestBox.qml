import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.TextBox {
    id: control

    Popup {}

    Component.onCompleted: console.log('AutoSuggestBox is loaded')
}
