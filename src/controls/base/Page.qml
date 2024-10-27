import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

Page {
    id: control
    opacity: visible
    visible: false
    transform: Translate {
        y: control.visible ? 0 : 80
        Behavior on y {
            enabled: !control.animationDisabled && AppTheme.animation_enabled
            NumberAnimation {
                duration: 167
                easing.type: Easing.OutCubic
            }
        }
    }

    Behavior on opacity {
        enabled: !control.animationDisabled && AppTheme.animation_enabled
        NumberAnimation {
            duration: 167
        }
    }

    signal animationFinished

    property bool animationDisabled: false

    Timer {
        id: timer
        interval: !control.animationDisabled && AppTheme.animation_enabled ? 200 : 0
        onTriggered: control.animationFinished()
    }

    StackView.onRemoved: destroy()
    Component.onCompleted: {
        control.visible = true;
        timer.restart();
    }
}
