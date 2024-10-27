import QtQuick.Window
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    title: 'Controls'
    height: Screen.height * 0.8
    width: Screen.width * 0.8

    BaseControls.ScrollablePage {
        id: page

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 320
        }

        Text {
            text: 'Hello, World!'
            font: AppFont.title
        }

        Text {
            text: 'Hello, World!'
        }
    }
}
