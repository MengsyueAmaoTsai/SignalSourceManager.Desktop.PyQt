import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base

FluentWindow {
    id: window

    title: 'Gallery - Home'
    width: 1000
    height: 668
    minimumWidth: 668
    minimumHeight: 320

    // launchMode: WindowLaunchMode.SingleTask
    // fitsAppBarWindows: true
    // appTitleBar: FluentAppTitleBar {
        // height: 30
        // showDark: true
        // darkClickListener: button => handleDarkChanged(button)
        // closeClickListener: () => {
        //     dialog_close.open();
        // }
        // z: 7
    // }

    SystemTrayIcon {
        id: systemTray
        visible: true
        icon.source: 'qrc:/static/images/favicon.ico'
        tooltip: 'Gallery'
        menu: Menu {
            MenuItem {
                text: 'Exit'
                onTriggered: WindowManager.closeAllWindowsAndExit()
            }
        }
        onActivated: reason => {
            console.log('SystemTrayIcon.onActivated. Reason:', reason);
        }
    }

    Flipable {
        id: flipable

        anchors.fill: parent
        transitions: Transition {
            NumberAnimation {
                target: flipable
                property: "flipAngle"
                duration: 1000
                easing.type: Easing.OutCubic
            }
        }
        transform: Rotation {
            id: roation
            origin.x: flipable.width / 2
            origin.y: flipable.height / 2
            axis.x: 0
            axis.y: 1
            axis.z: 0
            angle: flipable.flipAngle
        }
        states: State {
            PropertyChanges {
                target: flipable
                flipAngle: 180
            }
            when: flipable.flipped
        }
        front: Item {
            visible: flipable.flipAngle !== 180
            anchors.fill: flipable

            FluentNavigationView {
                width: parent.width
                height: parent.height
                topPadding: {
                    const isMacos = false;

                    // if (window.useSystemAppTitleBar) {
                    //     return 0;
                    // }

                    return isMacos ? 20 : 0;
                }
                title: 'Gallery'
                logoSource: 'qrc:/static/images/favicon.ico'
                z: 999
                // pageMode: NoStack
                // items: NavigationItems
                // footerItems: FooterItems
                // displayMode: 'compact'
                // onLogoClicked: {}
                // autoSuggestBox: FluentAutoSuggestBox {}
                Component.onCompleted: {
                    console.warn('FluentNavigationView.qml Component.onCompleted');
                }
            }
        }
        back: Item {
            visible: flipable.flipAngle !== 0
            anchors.fill: flipable
            Row {
                anchors {
                    top: parent.top
                    left: parent.left
                    topMargin: 5
                    leftMargin: 5
                }
                FluentButton {
                    content: 'Back'
                    width: 30
                    height: 30
                    onClicked: flipable.flipped = false
                }

                FluentButton {
                    content: 'Reload'
                    width: 30
                    height: 30
                    onClicked: remoteLoader.reload()
                }
            }

            // Item {
            //     id: remoteLoader
            // }
        }

        property bool flipped: false
        property real flipAngle: 0
    }

    // Component {
    //     id: revealComponent
    // CircularReveal {}
    // }

    ComponentLoader {
        id: revealLoader
        anchors.fill: parent
    }

    Component.onCompleted: console.warn('GalleryMainWindow.qml Component.onCompleted')
    Component.onDestruction: WindowManager.closeAllWindowsAndExit()
}
