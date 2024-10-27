import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Popup {
    id: control

    padding: 0
    modal: true
    parent: Overlay.overlay
    x: Math.round((context.parentWidth - width) / 2)
    y: Math.round((context.parentHeight - height) / 2)
    closePolicy: Popup.NoAutoClose

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            duration: AppTheme.animtation_enbaled ? 83 : 0
            from: 0
            to: 1
        }
    }
    height: Math.min(implicitHeight, context.parentHeight)
    exit: Transition {
        NumberAnimation {
            property: "opacity"
            duration: AppTheme.animtation_enbaled ? 83 : 0
            from: 1
            to: 0
        }
    }
    background: Rectangle {
        // will replace with a custom Rectangle
        radius: [5, 5, 5, 5]
        color: AppTheme.theme === 'Dark' ? Qt.rgba(43 / 255, 43 / 255, 43 / 255, 1) : Qt.rgba(1, 1, 1, 1)
        BaseControls.Shadow {
            radius: 5
        }
    }

    QtObject {
        id: context
        property int parentHeight: {
            if (control.parent) {
                return control.parent.height;
            }
            return control.height;
        }
        property int parentWidth: {
            if (control.parent) {
                return control.parent.width;
            }
            return control.width;
        }
    }
}
