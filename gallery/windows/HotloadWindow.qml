import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window
    title: qsTr("Hot Loader")
    width: 800
    height: 600
    minimumWidth: 520
    minimumHeight: 200
    launchMode: 'SingleTask'

    // FileWatcher {
    //     id: watcher
    //     onFileChanged: {
    //         loader.reload();
    //     }
    // }
    BaseControls.Frame {
        anchors.fill: parent
        BaseControls.RemoteComponentLoader {
            id: loader
            anchors.fill: parent
            statusMode: 'Success'
            lazy: true
            errorItem: Item {
                BaseControls.TextBlock {
                    text: loader.itemLodaer().sourceComponent.errorString()
                    color: "red"
                    anchors.fill: parent
                    wrapMode: Text.WrapAnywhere
                    padding: 20
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
        }
        BaseControls.TextBlock {
            text: qsTr("Drag in a qml file")
            font: AppFont.title
            anchors.centerIn: parent
            visible: !loader.itemLodaer().item && loader.statusMode === 'Success'
        }
        Rectangle {
            radius: 4
            anchors.fill: parent
            color: "#33333333"
            visible: drop_area.containsDrag
        }
        DropArea {
            id: drop_area
            anchors.fill: parent
            onEntered: event => {
                if (!event.hasUrls) {
                    event.accepted = false;
                    return;
                }
                var url = getUrlByEvent(event);
                if (url === "") {
                    event.accepted = false;
                    return;
                }
                var fileExtension = url.substring(url.lastIndexOf(".") + 1);
                if (fileExtension !== "qml") {
                    event.accepted = false;
                    return;
                }
                return true;
            }
            onDropped: event => {
                var url = getUrlByEvent(event);
                if (url !== "") {
                    loader.source = url;
                    watcher.path = url;
                    loader.reload();
                }
            }
        }
    }

    function getUrlByEvent(event) {
        var url = "";
        if (event.urls.length === 0) {
            url = "file:///" + event.getDataAsString("text/plain");
        } else {
            url = event.urls[0].toString();
        }
        return url;
    }
}
