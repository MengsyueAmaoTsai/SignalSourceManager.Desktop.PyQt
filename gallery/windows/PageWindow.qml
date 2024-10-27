import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    width: 800
    height: 600
    minimumWidth: 520
    minimumHeight: 200

    // launchMode: FluWindowType.SingleInstance

    BaseControls.ComponentLoader {
        id: loader
        anchors.fill: parent
    }

    onInitArgument: arg => {
        window.title = arg.title;
        loader.setSource(arg.url, {
            animationEnabled: false
        });
    }
}
