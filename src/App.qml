import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import BaseControls

ApplicationWindow {
    id: root
    visible: true

    ColumnLayout {
        id: baseLayout
        anchors.fill: parent

        RCButton {
            id: baseButton
            text: 'Fluent button'
        }

        RCText {
            id: baseText
            text: 'Fluent text'
        }

        RCIcon {
            id: baseIcon
        }

        RCCheckBox {
            id: baseCheckBox
            text: 'Fluent checkbox'
        }
    }
}
