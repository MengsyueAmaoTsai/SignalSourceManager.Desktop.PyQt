import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Button {
    id: control

    //#region FluentUI properties
    property string appearance: 'Neutral' // Enum values => Neutral | Accent | Hypertext | Lightweight | Outline | Stealth | Filled
    property var iconStart: undefined // The icon displayed at the start of button content
    property var iconEnd: undefined // The icon displayed at the end of button content

    //#endregion
}
