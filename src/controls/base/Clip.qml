import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Rectangle { // BaseControls.Rectangle
    id: control
    color: "#00000000"
    // layer.enabled: !FluTools.isSoftware()
    layer.enabled: true
    layer.textureSize: Qt.size(control.width * 2 * Math.ceil(Screen.devicePixelRatio), control.height * 2 * Math.ceil(Screen.devicePixelRatio))
    layer.effect: OpacityMask {
        maskSource: ShaderEffectSource {
            // sourceItem: FluRectangle{
            //     radius: control.radius
            //     width: control.width
            //     height: control.height
            // }
            sourceItem: Rectangle {
                radius: control.radius
                width: control.width
                height: control.height
            }
        }
    }
}
