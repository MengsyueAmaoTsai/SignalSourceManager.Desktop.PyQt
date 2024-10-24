import RichillCapital.SignalSourceManager.Desktop.Controls.Base

BaseWindow {
    id: window
    width: 800
    height: 600
    minimumWidth: 520
    minimumHeight: 200

    ComponentLoader {
        id: loader
        anchors.fill: parent
    }
}
