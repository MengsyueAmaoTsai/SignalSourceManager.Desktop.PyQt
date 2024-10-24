import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window
    width: 800
    height: 600

    onArgumentsInitialized: args => {
        const objectKeys = Object.keys(args);
        console.log('Keys: ', objectKeys.length);
        objectKeys.forEach(key => {
            console.log('Object key: ' + key + ', value: ' + args[key]);
        });
    }

    ComponentLoader {
        id: loader
        anchors.fill: parent
    }
}
