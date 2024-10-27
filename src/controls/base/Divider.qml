import QtQuick
import QtQuick.Window

Item {
    id: control

    property int orientation: Qt.Horizontal
    property int spacing: 0
    property int size: 1

    QtObject {
        id: context
        property bool isVertical: control.orientation === Qt.Vertical
        property int parentHeight: {
            if (control.parent) {
                return control.parent.height;
            }
            return control.height;
        }
        property int parentWidth: {
            if (control.parent) {
                return control.parent.width;
            }
            return control.width;
        }
    }

    width: context.isVertical ? spacing * 2 + size : context.parentWidth
    height: context.isVertical ? context.parentHeight : spacing * 2 + size

    Rectangle {
        color: AppTheme.divider_color
        width: context.isVertical ? size : control.width
        height: context.isVertical ? control.height : size
        anchors.centerIn: parent
    }
    
    // FluRectangle{
    //     color: FluTheme.dividerColor
    //     width: d.isVertical ? size : control.width
    //     height: d.isVertical ? control.height : size
    //     anchors.centerIn: parent
    // }
}
