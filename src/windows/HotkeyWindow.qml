import RichillCapital.SignalSourceManager.Desktop.Controls.Base

BaseWindow {
    id: window
    title: 'Hotkey'
    width: 250
    height: 250

    BaseText {
        anchors.centerIn: parent
        font: font_provider.title
        text: window.sequence
    }
}
