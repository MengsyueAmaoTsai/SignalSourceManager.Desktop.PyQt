import QtQuick
import QtQuick.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.StatusLayout {
    id: control
    property url source: ""
    property bool lazy: false
    color: "transparent"
    onErrorClicked: {
        reload();
    }
    Component.onCompleted: {
        if (!lazy) {
            loader.source = control.source;
        }
    }
    BaseControls.ComponentLoader {
        id: loader
        anchors.fill: parent
        asynchronous: true
        onStatusChanged: {
            if (status === Loader.Error) {
                control.statusMode = FluStatusLayoutType.Error;
            } else if (status === Loader.Loading) {
                control.statusMode = FluStatusLayoutType.Loading;
            } else {
                control.statusMode = FluStatusLayoutType.Success;
            }
        }
    }

    function reload() {
        var timestamp = Date.now();
        loader.source = control.source + "?" + timestamp;
    }
    function itemLodaer() {
        return loader;
    }
}
