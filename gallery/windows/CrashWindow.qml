import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: 'Friendly Reminder'
    height: 400
    width: 300

    // fixedSize: true
    // showMinimize: false
    // showStayOnTop: false

    Image {
        width: 540 / 2
        height: 285 / 2
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 40
        }
        // source: 'qrc:/static/images/ic_crash.png'
    }
    BaseControls.TextBlock {
        id: infoText
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 240
        }
        text: 'An occurred error has been reported to the developers. We will fix it as soon as possible.'
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    RowLayout {
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 20
        }

        BaseControls.Button {
            text: 'Report logs'
            onClicked: {
                console.log('Report logs');
            }
        }
        Item {
            width: 30
            height: 1
        }
        BaseControls.Button {
            text: 'Restart application'
            onClicked: BaseControls.WindowManager.quit(931)
        }
    }
    onArgumentsInitialized: args => console.log('Arguments:', args)
}
