import QtQuick 
import QtQuick.Controls 
import QtQuick.Layouts 
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: 'Friendly Reminder'
    width: 300
    height: 400
    fixSize: true
    showMinimize: false

    property string crashFilePath

    Image {
        width: 540 / 2
        height: 285 / 2
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 40
        }
        source: "qrc:/gallery/assets/images/ic_crash.png"
    }

    BaseControls.TextBlock {
        id: text_info
        anchors {
            top: parent.top
            topMargin: 240
            left: parent.left
            right: parent.right
            leftMargin: 10
            rightMargin: 10
        }
        wrapMode: Text.WrapAnywhere
        text: "We apologize for the inconvenience caused by an unexpected error"
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
            text: "Report Logs"
            onClicked: console.log('FluTools.showFileInFolder(crashFilePath)')
        }
        Item {
            width: 30
            height: 1
        }
        BaseControls.Button {
            text: "Restart Program"
            onClicked: {
                FluRouter.exit(931);
            }
        }
    }

    Component.onCompleted: {
        window.stayTop = true;
    }

    onInitArgument: argument => {
        crashFilePath = argument.crashFilePath;
    }
}
