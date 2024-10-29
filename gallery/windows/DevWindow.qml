import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    title: 'Dev'
    width: 1000
    height: 668
    fixSize: true
    showMinimize: false

    BaseControls.MenuBar {
        BaseControls.Menu {
            title: 'File'
            BaseControls.MenuItem {
                text: 'New'
            }
            BaseControls.MenuItem {
                text: 'Open'
            }
            BaseControls.MenuItem {
                text: 'Save'
            }
            BaseControls.MenuItem {
                text: 'Save As'
            }
            BaseControls.MenuItem {
                text: 'Exit'
            }
        }
    }
}
