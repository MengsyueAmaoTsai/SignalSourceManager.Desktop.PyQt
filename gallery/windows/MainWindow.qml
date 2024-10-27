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
                id: navigationView
                title: 'FluentUI'
                logo: 'qrc:/static/images/favicon.ico'
                paneDisplayMode: 'Auto'
                width: parent.width
                height: parent.height
                topPadding: 0
                z: 999
                // pageMode:
                // footerItems:
                // onLogoClicked:
                menuItems: [
                    BaseControls.NavigationViewItem {
                        content: 'Home'
                        url: 'qrc:/gallery/pages/HomePage.qml'
                    }
                ]
                autoSuggestBox: BaseControls.AutoSuggestBox {
                    placeholder: 'Search'
                    // iconSource: FluentIcons.Search
                    // items: ItemsOriginal.getSearchData()
                    // onItemClicked: console.log('TODO: Implement NavigationView.qml autoSuggestBox.onItemClicked');
                }
                Component.onCompleted: {
                    console.log('TODO: Implement NavigationView.qml Component.onCompleted');
                    navigationView.setCurrentIndex(0);
                }
            }
        }
        back: Item {
            anchors.fill: flipable
            visible: flipable.flipAngle !== 0

            Row {
                z: 8
                anchors {
                    top: parent.top
                    left: parent.left
                    topMargin: 5
                    leftMargin: 5
                }

                BaseControls.Button {
                    width: 30
                    height: 30
                    // iconSize: 13
                    // iconSource: FluentIcons.ChromeBack
                    onClicked: flipable.flipped = false
                }
                BaseControls.Button {
                    width: 30
                    height: 30
                    // iconSize: 13
                    // iconSource: FluentIcons.Sync
                    // onClicked: loader.reload()
                }
            }

            // RemoteLoader {}
        }

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
