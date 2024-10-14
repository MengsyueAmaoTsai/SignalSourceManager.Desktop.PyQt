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

        BaseButton {
            id: baseButton
            text: 'Fluent button'
            onClicked: {
                basePopup.open();
                console.log('Button clicked');
            }
        }

        BaseText {
            id: baseText
            text: 'Fluent text'
        }

        BaseIcon {
            id: baseIcon
        }

        BaseCheckBox {
            id: baseCheckBox
            text: 'Fluent checkbox'
        }

        BaseRectangle {
            id: baseRectangle
        }

        BaseTextBox {
            id: baseTextBox
        }

        BaseRadioButton {
            id: baseRadioButton
            text: 'Fluent radio button'
        }

        BasePopup {
            id: basePopup
        }
    }
}
