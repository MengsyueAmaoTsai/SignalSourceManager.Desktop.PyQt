import QtQuick
import QtQuick.Controls

import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts
import Qt.labs.qmlmodels

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

ApplicationWindow {
    id: app

    title: 'RichillCapital.SignalSourceManager.Desktop'
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Page {
        id: buttonsPage
    }
}
