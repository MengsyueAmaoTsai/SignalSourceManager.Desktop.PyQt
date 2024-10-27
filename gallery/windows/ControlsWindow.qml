import QtQuick.Window
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    title: 'Controls'
    height: Screen.height * 0.8
    width: Screen.width * 0.8

    BaseControls.ScrollBar {
        visible: true
    }
}
