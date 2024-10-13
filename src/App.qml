import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

import "./controls/LeftNavBar"
import "./views/Home"
import "./views/SignalSources"
import "./views/Settings"
import "./views/About"

ApplicationWindow {
    id: app
    title: mainViewModel.app_title
    visible: true
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    minimumHeight: 600
    minimumWidth: 900

    Component.onCompleted: {
        mainViewModel.initialize();
        console.log('Application loaded');
    }

    Component.onDestruction: console.log('Application destroyed')

    Shortcut {
        sequence: "Ctrl+R"
        onActivated: devTool.reload()
    }

    Shortcut {
        sequence: "Ctrl+1"
        onActivated: {
            pageStack.replace(homePage);
        }
    }

    Shortcut {
        sequence: "Ctrl+2"
        onActivated: {
            pageStack.replace(signalSourcesPage);
        }
    }

    Shortcut {
        sequence: "Ctrl+9"
        onActivated: {
            pageStack.replace(settingsPage);
        }
    }

    Shortcut {
        sequence: "Ctrl+0"
        onActivated: {
            pageStack.replace(aboutPage);
        }
    }

    RowLayout {
        id: appLayout
        anchors.fill: parent

        LeftNavBar {
            id: leftNavBar
            z: 1
            visible: true
        }

        StackView {
            id: pageStack
            initialItem: homePage
        }
    }

    // Pages
    Component {
        id: homePage
        Home {}
    }

    Component {
        id: signalSourcesPage
        SignalSources {}
    }

    Component {
        id: settingsPage
        Settings {}
    }

    Component {
        id: aboutPage
        About {}
    }

    // Windows
}
