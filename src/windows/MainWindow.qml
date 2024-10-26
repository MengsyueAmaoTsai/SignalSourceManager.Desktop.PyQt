import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: 'RichillCapital.SignalSourceManager.Desktop'
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    minimumWidth: 668
    minimumHeight: 320

    // launchMode:
    // firstAppTitleBarWindow: true
    appTitleBar: BaseControls.AppTitleBar {
        z: 7
        height: 30
        showSwitchThemeButton: true
    }

    Component.onDestruction: {
        BaseControls.WindowManager.closeAllWindows();
        BaseControls.WindowManager.quit();
    }
}
