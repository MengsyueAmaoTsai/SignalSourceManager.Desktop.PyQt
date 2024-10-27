import QtQuick
import QtQuick.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Text {
    id: control
    font.family: fontLoader.name
    font.pixelSize: iconSize
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    color: iconColor
    text: (String.fromCharCode(iconSource).toString(16))
    opacity: iconSource > 0
    property int iconSource
    property int iconSize: 20
    property color iconColor: AppTheme.theme === 'Dark' ? "#FFFFFF" : "#000000"

    FontLoader {
        id: fontLoader
        source: "qrc:/static/fonts/FluentIcons.ttf"
    }
}
