import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Item {
    id: control

    property Component autoSuggestBox: undefined

    //#region FluentUI properties
    property string paneDisplayMode: 'Auto' // Auto | Top | Left | LeftCompact | LeftMinimal
    //#endregion
    Component.onCompleted: console.log('TODO: Implement NavigationView.qml Component.onCompleted')
}
