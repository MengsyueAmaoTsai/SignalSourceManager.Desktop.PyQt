import QtQuick
import QtQuick.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Background {
    id: control
    property Item inputItem
    color: {
        if (inputItem && inputItem.disabled) {
            return AppTheme.theme === 'Dark' ? Qt.rgba(59 / 255, 59 / 255, 59 / 255, 1) : Qt.rgba(252 / 255, 252 / 255, 252 / 255, 1);
        }
        if (inputItem && inputItem.activeFocus) {
            return AppTheme.theme === 'Dark' ? Qt.rgba(36 / 255, 36 / 255, 36 / 255, 1) : Qt.rgba(1, 1, 1, 1);
        }
        if (inputItem && inputItem.hovered) {
            return AppTheme.theme === 'Dark' ? Qt.rgba(68 / 255, 68 / 255, 68 / 255, 1) : Qt.rgba(251 / 255, 251 / 255, 251 / 255, 1);
        }
        return AppTheme.theme === 'Dark' ? Qt.rgba(62 / 255, 62 / 255, 62 / 255, 1) : Qt.rgba(1, 1, 1, 1);
    }
    border.width: 1
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: d.startColor
        }
        GradientStop {
            position: 1 - d.offsetSize / control.height
            color: d.startColor
        }
        GradientStop {
            position: 1.0
            color: d.endColor
        }
    }
    bottomMargin: 1
    QtObject {
        id: d
        property int offsetSize: 3
        property color startColor: AppTheme.theme === 'Dark' ? Qt.rgba(66 / 255, 66 / 255, 66 / 255, 1) : Qt.rgba(232 / 255, 232 / 255, 232 / 255, 1)
        property color endColor: {
            if (!control.enabled) {
                return d.startColor;
            }
            return AppTheme.theme === 'Dark' ? Qt.rgba(123 / 255, 123 / 255, 123 / 255, 1) : Qt.rgba(132 / 255, 132 / 255, 132 / 255, 1);
        }
    }
    // FluClip {
    //     anchors.fill: parent
    //     radius: [control.radius, control.radius, control.radius, control.radius]
    //     visible: inputItem && inputItem.activeFocus
    //     Rectangle {
    //         width: parent.width
    //         height: 2
    //         anchors.bottom: parent.bottom
    //         color: FluTheme.primaryColor
    //     }
    // }
}
