import QtQuick
import QtQuick.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

QtObject {
    property string key
    property int _idx
    property var _ext
    property var _parent
    property bool visible: true
    // Component.onCompleted: key = FluTools.uuid()
}
