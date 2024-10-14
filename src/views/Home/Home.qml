import QtQuick
import QtQuick.Controls

import BaseControls

BaseWindow {
    id: root
    title: 'FluentUI'

    appBar: BaseAppBar {}

    Text {
        text: 'Hello, World!'
        anchors.centerIn: parent
    }
}
