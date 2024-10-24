import RichillCapital.SignalSourceManager.Desktop.Controls.Base

BaseWindow {
    id: window

    title: 'Single task window'
    width: 500
    height: 600

    BaseText {
        anchors.centerIn: parent
        text: 'I am a SingleTask mode window, and if I exists, I activate the window'
    }
}
