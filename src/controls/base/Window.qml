import QtQuick
import QtQuick.Controls

Window {
    id: control
    color: 'transparent'

    Component.onCompleted: console.log('BaseWindow loaded.')

    Loader {}

    Item {
        ComponentLoader {}
        ComponentLoader {}
        Item {}
        ComponentLoader {}
        // InfoBar
        // WindowLifecycle
        Rectangle {
        }
    }
}
