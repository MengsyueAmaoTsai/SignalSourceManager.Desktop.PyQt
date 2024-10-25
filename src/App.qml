import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

ApplicationWindow {
    id: app
    visible: true
    width: 1000
    height: 668

    BaseControls.AppTitleBar {
        id: appTitleBar

        title: 'RichillCapital.SignalSourceManager.Desktop'
        iconSource: 'qrc:/static/images/favicon.ico'
    }
}
