import QtQuick
import QtQuick.Controls

Window {
    id: control

    color: 'transparent'

    property Item appBar: AppBar {}

    Component.onCompleted: {
        console.log('BaseWindow loaded');
    }
}
