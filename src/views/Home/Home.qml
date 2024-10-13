import QtQuick.Controls
import QtQuick.Layouts

import "../../controls/base"

Page {
    id: root

    ColumnLayout {
        id: layout
        width: root.width
        height: root.height

        RCText {
            text: 'Fluent Text'
        }

        RCButton {
            text: 'Fluent Button'
            onClicked: console.log('Button clicked')
        }
    }
}
