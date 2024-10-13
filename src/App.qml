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

        RCText {
            id: baseText
            text: 'Fluent text'
        }

        RCButton {
            id: baseButton
            text: 'Fluent button'
        }

        RCIcon {
            id: baseIcon
        }
    }
}
