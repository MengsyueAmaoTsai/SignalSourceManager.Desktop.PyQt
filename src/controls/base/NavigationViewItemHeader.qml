import QtQuick
import QtQuick.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

QtObject {
    property string key
    property int _idx
    property bool visible: true
    property string title
    property var parent
    // Component.onCompleted: key = FluTools.uuid();
}
