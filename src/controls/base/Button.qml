import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Button {
    id: control

    //#region FluentUI properties
    property string appearance: 'Neutral' // Enum values => Neutral | Accent | Hypertext | Lightweight | Outline | Stealth | Filled
    property var iconStart: undefined // The icon displayed at the start of button content
    property var iconEnd: undefined // The icon displayed at the end of button content
    property real iconSize: 20

    //#endregion

    contentItem: BaseControls.ComponentLoader {
        sourceComponent: {
            if (display === Button.TextUnderIcon) {
                return verticalWrapper;
            }
            return horizontalWrapper;
        }
    }

    Component {
        id: horizontalWrapper
        RowLayout {
            BaseControls.ComponentLoader {
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            }

            BaseControls.TextBlock {
                text: control.text
                Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                // font
                // color
                // visible
            }
        }
    }

    // Tooltip
}
