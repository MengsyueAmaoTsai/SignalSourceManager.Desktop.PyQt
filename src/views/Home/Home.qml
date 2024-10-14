import QtQuick

import QtQuick.Controls

import BaseControls

BaseWindow {
    id: root
    title: 'FluentUI'
    appBar: BaseAppBar {}
    Component.onCompleted: console.log('Home loaded')

    Component.onDestruction: console.log('Home destroyed')
}
