import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentTextBox {
    id: control

    readonly property string emptyText: qsTr('No results found')

    Component.onCompleted: console.log('FluentAutoSuggestBox.qml loaded');
}
