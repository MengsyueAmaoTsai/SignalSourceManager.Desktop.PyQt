import QtQuick
import QtQuick.Controls

Page {
    id: root

    Component.onCompleted: {
        console.log('Home page loaded');
    }

    Component.onDestruction: {
        console.log('Home page destroyed');
    }

    Text {
        text: 'Home Page'
        anchors.centerIn: parent
    }
}
