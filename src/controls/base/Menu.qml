import QtQuick
import QtQuick.Controls
import QtQuick.Controls.impl
import QtQuick.Templates as T
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

T.Menu {
    id: control
    property bool animationEnabled: true
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, contentHeight + topPadding + bottomPadding)
    margins: 0
    overlap: 1
    spacing: 0
    delegate: BaseControls.MenuItem {}
    enter: Transition {
        NumberAnimation {
            property: "opacity"
            from: 0
            to: 1
            duration: AppTheme.animation_enabled && control.animationEnabled ? 83 : 0
        }
    }
    exit: Transition {
        NumberAnimation {
            property: "opacity"
            from: 1
            to: 0
            duration: AppTheme.animation_enabled && control.animationEnabled ? 83 : 0
        }
    }
    contentItem: ListView {
        implicitHeight: contentHeight
        model: control.contentModel
        interactive: Window.window ? contentHeight + control.topPadding + control.bottomPadding > Window.window.height : false
        clip: true
        currentIndex: control.currentIndex
        ScrollBar.vertical: BaseControls.ScrollBar {}
    }
    background: Rectangle {
        implicitWidth: 150
        implicitHeight: 36
        color: AppTheme.theme === 'Dark' ? Qt.rgba(45 / 255, 45 / 255, 45 / 255, 1) : Qt.rgba(252 / 255, 252 / 255, 252 / 255, 1)
        border.color: AppTheme.theme === 'Dark' ? Qt.rgba(26 / 255, 26 / 255, 26 / 255, 1) : Qt.rgba(191 / 255, 191 / 255, 191 / 255, 1)
        border.width: 1
        radius: 5
        BaseControls.Shadow {}
    }
    T.Overlay.modal: Rectangle {
        // color: FluTools.withOpacity(control.palette.shadow, 0.5)
    }
    T.Overlay.modeless: Rectangle {
        // color: FluTools.withOpacity(control.palette.shadow, 0.12)
    }
}
