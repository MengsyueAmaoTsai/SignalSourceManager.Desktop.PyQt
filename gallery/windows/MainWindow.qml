import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: 'QML Control Gallery'
    width: Screen.width * 0.8
    height: Screen.height * 0.8
    minimumWidth: 668
    minimumHeight: 320

    Flipable {
        id: flipable
        anchors.fill: parent
        transform: Rotation {
            id: rotation
            origin.x: flipable.width / 2
            origin.y: flipable.height / 2
            axis {
                x: 0
                y: 1
                z: 0
            }
            angle: flipable.flipAngle
        }
        states: State {
            PropertyChanges {
                target: flipable
                flipAngle: 180
            }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation {
                target: flipable
                property: "flipAngle"
                duration: 1000
                easing.type: Easing.OutCubic
            }
        }

        front: Item {
            visible: flipable.flipAngle !== 180
            anchors.fill: flipable
            BaseControls.NavigationView {
                width: parent.width
                height: parent.height
                z: 999
                // pageMode:
                // items:
                // footerItems:
                // topPadding:
                // displayMode:
                // logo:
                // title:
                // onLogoClicked:
                autoSuggestBox: BaseControls.AutoSuggestBox {
                    placeholder: 'Search'
                    // iconSource: FluentIcons.Search
                    // items: ItemsOriginal.getSearchData()
                    // onItemClicked: console.log('TODO: Implement NavigationView.qml autoSuggestBox.onItemClicked');
                }
                Component.onCompleted: {
                    console.log('TODO: Implement NavigationView.qml Component.onCompleted');
                }
            }
        }
        back: Item {}

        property bool flipped: false
        property real flipAngle: 0
    }

    SystemTrayIcon {
        id: trayIcon
        visible: true
        icon.source: 'qrc:/static/images/favicon.ico'
        tooltip: 'QML Control Gallery'
        menu: Menu {
            MenuItem {
                text: 'Quit'
                onTriggered: {
                    BaseControls.WindowManager.closeAllWindows();
                    BaseControls.WindowManager.quit();
                }
            }
        }
        onActivated: reason => {
            if (reason === SystemTrayIcon.Trigger) {
                window.show();
                window.raise();
                window.requestActivate();
            }
        }
    }

    Component.onCompleted: {
        console.log('TODO: Implement check update on startup');
        // QmlEventBus.registerEvent(checkUpdateEvent);
    }

    Component.onDestruction: {
        BaseControls.WindowManager.closeAllWindows();
        BaseControls.WindowManager.quit();
    }
}
