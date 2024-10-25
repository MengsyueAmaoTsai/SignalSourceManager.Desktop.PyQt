import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window

    title: 'Gallery - Home'
    width: 1000
    height: 668
    minimumWidth: 668
    minimumHeight: 320

    // launchMode: WindowLaunchMode.SingleTask
    // fitsAppBarWindows: true
    // appTitleBar: FluentAppTitleBar {
    //     height: 30
    //     showDark: true
    //     darkClickListener:(button)=>handleDarkChanged(button)
    //     closeClickListener: ()=>{dialog_close.open()}
    //     z:7
    // }

    Component.onCompleted: console.warn('GalleryMainWindow.qml Component.onCompleted')
    Component.onDestruction: WindowManager.closeAllWindowsAndExit()
}
