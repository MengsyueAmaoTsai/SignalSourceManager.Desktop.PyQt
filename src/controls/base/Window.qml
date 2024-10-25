import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: control

    Component.onCompleted: console.log('New window created.')
    onVisibleChanged: console.log('Window visibility changed to', visible)
}
