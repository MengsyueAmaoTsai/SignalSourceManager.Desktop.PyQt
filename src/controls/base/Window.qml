import QtQuick
import QtQuick.Controls

Window {
    id: control

    property Item appBar: AppBar {
    }

    Component.onCompleted: {
        console.log('BaseWindow loaded');
    }
}
