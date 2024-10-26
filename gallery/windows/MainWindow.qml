import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: 'QML Control Gallery'
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    minimumWidth: 668
    minimumHeight: 320

    SystemTrayIcon {
        id: trayIcon
        visible: true
        icon.source: 'qrc:/static/images/favicon.ico'
        tooltip: 'QML Control Gallery'
        menu: Menu {
            MenuItem {
                text: 'Quit'
                onTriggered: {
                    BaseControls.WindowManager.closeAllWindows();
                    BaseControls.WindowManager.quit();
                }
            }
        }
        onActivated: reason => {
            if (reason === SystemTrayIcon.Trigger) {
                window.show();
                window.raise();
                window.requestActivate();
            }
        }
    }

    Component.onCompleted: {
        console.log('TODO: Implement check update on startup');
        // QmlEventBus.registerEvent(checkUpdateEvent);
    }

    Component.onDestruction: {
        BaseControls.WindowManager.closeAllWindows();
        BaseControls.WindowManager.quit();
    }
}
