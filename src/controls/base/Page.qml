import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Page {
    id: control

    // property int launchMode: FluPageType.SingleTop
    StackView.onRemoved: destroy()
    padding: 5
    visible: false
    opacity: visible
    transform: Translate {
        y: control.visible ? 0 : 80
        Behavior on y {
            enabled: control.animationEnabled && AppTheme.animation_enabled
            NumberAnimation {
                duration: 167
                easing.type: Easing.OutCubic
            }
        }
    }
    header: BaseControls.ComponentLoader {
        sourceComponent: control.title === "" ? undefined : headerComponent
    }
    background: Item {}
    Behavior on opacity {
        enabled: control.animationEnabled && AppTheme.animation_enabled
        NumberAnimation {
            duration: 83
        }
    }

    property string url: ""
    property bool animationEnabled: AppTheme.animation_enabled

    Component {
        id: headerComponent

        Item {
            implicitHeight: 40
            BaseControls.TextBlock {
                id: titleTextBlock

                text: control.title
                font: AppFont.title
                anchors {
                    left: parent.left
                    leftMargin: 5
                }
            }
        }
    }

    Component.onCompleted: console.visible = true
}
