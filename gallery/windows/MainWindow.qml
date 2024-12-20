import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    launchMode: 'SingleTask'
    fitsAppBarWindows: true
    title: "Control Gallery"
    width: 1000
    height: 668
    minimumWidth: 668
    minimumHeight: 320
    appBar: BaseControls.AppTitleBar {
        height: 30
        showDark: true
        darkClickListener: button => handleDarkChanged(button)
        closeClickListener: () => {
            quitDialog.open();
        }
        z: 7
    }
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
        back: Item {
            anchors.fill: flipable
            visible: flipable.flipAngle !== 0

            Row {
                id: layout_back_buttons
                z: 8
                anchors {
                    top: parent.top
                    left: parent.left
                    topMargin: 5
                    leftMargin: 5
                }
                BaseControls.Button {
                    // iconSource: FluentIcons.ChromeBack
                    iconSize: 13
                    width: 30
                    height: 30
                    onClicked: flipable.flipped = false
                }
                BaseControls.Button {
                    // iconSource: FluentIcons.Sync
                    iconSize: 13
                    width: 30
                    height: 30
                    onClicked: loader.reload()
                }
                Component.onCompleted: window.setHitTestVisible(layout_back_buttons)
            }
            BaseControls.RemoteComponentLoader {
                id: loader

                lazy: true
                anchors.fill: parent
                source: "https://zhu-zichu.gitee.io/Qt_174_LieflatPage.qml"
            }
        }
        front: Item {
            visible: flipable.flipAngle !== 180
            anchors.fill: flipable
            BaseControls.NavigationView {
                id: navigationView

                pageMode: 'NoStack'
                displayMode: 'Auto'
                title: "FluentUI"
                logo: "qrc:/static/images/favicon.ico"
                width: parent.width
                height: parent.height
                z: 999
                autoSuggestBox: BaseControls.AutoSuggestBox {
                    // iconSource: FluentIcons.Search
                    items: BaseControls.ItemsOriginal.getSearchData()
                    placeholderText: qsTr("Search")
                    onItemClicked: data => {
                        BaseControls.ItemsOriginal.startPageByItem(data);
                    }
                }
                items: BaseControls.ItemsOriginal
                footerItems: BaseControls.ItemsFooter

                property int clickCount: 0

                Component.onCompleted: {
                    BaseControls.ItemsOriginal.navigationView = navigationView;
                    BaseControls.ItemsOriginal.paneItemMenu = nav_item_right_menu;
                    BaseControls.ItemsFooter.navigationView = navigationView;
                    BaseControls.ItemsFooter.paneItemMenu = nav_item_right_menu;
                    window.setHitTestVisible(navigationView.buttonMenu);
                    window.setHitTestVisible(navigationView.buttonBack);
                    window.setHitTestVisible(navigationView.imageLogo);
                    setCurrentIndex(0);
                }

                onLogoClicked: {
                    clickCount += 1;
                    showSuccess("%1:%2".arg(qsTr("Click Time")).arg(clickCount));
                    if (clickCount === 5) {
                        loader.reload();
                        flipable.flipped = true;
                        clickCount = 0;
                    }
                }
            }
        }

        property bool flipped: false
        property real flipAngle: 0
    }


    Component {
        id: nav_item_right_menu

        BaseControls.Menu {
            width: 186
            BaseControls.MenuItem {
                text: "Open in Separate Window"
                font: AppFont.caption
                onClicked: {
                    BaseControls.WindowManager.navigateTo("/page", {
                        title: modelData.title,
                        url: modelData.url
                    });
                }
            }
        }
    }

    BaseControls.TextBlock {
        text: "fps %1".arg('{Fps}')
        opacity: 0.3
        anchors {
            bottom: parent.bottom
            right: parent.right
            bottomMargin: 5
            rightMargin: 5
        }
    }

    BaseControls.ContentDialog {
        id: quitDialog

        title: "Quit"
        message: "Are you sure you want to exit the application?"
        negativeText: "Minimize"
        positiveText: "Quit"
        neutralText: "Cancel"
        // buttonFlags: FluContentDialogType.NegativeButton | FluContentDialogType.NeutralButton | FluContentDialogType.PositiveButton
        onNegativeClicked: {
            showMessage(qsTr("Friendly Reminder"), qsTr("FluentUI is hidden from the tray, click on the tray to activate the window again"));
            hideWindowTimer.restart();
        }
        onPositiveClicked: {
            BaseControls.WindowManager.closeAllWindows();
            BaseControls.WindowManager.quit();
        }
    }

    BaseControls.ContentDialog {
        id: updateDialog

        title: "Upgrade Tips"
        message: `FluentUI is currently up to date {newVersion} -- The current app version {currentVersion}` + " \nNow go and download the new version？\n\nUpdated content: \n" + body
        negativeText: 'Cancel'
        positiveText: 'OK'

        // buttonFlags: FluContentDialogType.NegativeButton | FluContentDialogType.PositiveButton

        property string body
        property string newVerson

        onPositiveClicked: Qt.openUrlExternally("https://github.com/zhuzichu520/FluentUI/releases/latest")
    }

    Timer {
        id: hideWindowTimer
        interval: 150
        onTriggered: window.hide()
    }

    SystemTrayIcon {
        visible: true
        icon.source: "qrc:/static/images/favicon.ico"
        tooltip: "FluentUI"
        menu: Menu {
            MenuItem {
                text: "Quit"
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

    BaseControls.ComponentLoader {
        id: revealLoader
        anchors.fill: parent
    }
    // Component {
    //     id: revealWarpper
    //     CircularReveal {
    //         id: reveal
    //         target: window.containerItem()
    //         anchors.fill: parent
    //         darkToLight: FluTheme.dark
    //         onAnimationFinished: {
    //             //动画结束后释放资源
    //             revealLoader.sourceComponent = undefined;
    //         }
    //         onImageChanged: {
    //             changeDark();
    //         }
    //     }
    // }

    Shortcut {
        sequence: "F5"
        context: Qt.WindowShortcut
        onActivated: {
            if (flipable.flipped) {
                loader.reload();
            }
        }
    }
    Shortcut {
        sequence: "F6"
        context: Qt.WindowShortcut
        onActivated: tour.open()
    }

    // FluentInitializrWindow {
    //     id: fluent_Initializr
    // }

    // FluEvent {
    //     name: "checkUpdate"
    //     onTriggered: {
    //         checkUpdate(false);
    //     }
    // }

    // FluTour {
    //     id: tour
    //     finishText: qsTr("Finish")
    //     nextText: qsTr("Next")
    //     previousText: qsTr("Previous")
    //     steps: {
    //         var data = [];
    //         if (!window.useSystemAppBar) {
    //             data.push({
    //                 title: qsTr("Dark Mode"),
    //                 description: qsTr("Here you can switch to night mode."),
    //                 target: () => appBar.buttonDark
    //             });
    //         }
    //         data.push({
    //             title: qsTr("Hide Easter eggs"),
    //             description: qsTr("Try a few more clicks!!"),
    //             target: () => navigationView.imageLogo
    //         });
    //         return data;
    //     }
    // }

    // NetworkCallable {
    //     id: callable
    //     property bool silent: true
    //     onStart: {
    //         console.debug("start check update...");
    //     }
    //     onFinish: {
    //         console.debug("check update finish");
    //         FluEventBus.post("checkUpdateFinish");
    //     }
    //     onSuccess: result => {
    //                    var data = JSON.parse(result);
    //                    console.debug("current version " + AppInfo.version);
    //                    console.debug("new version " + data.tag_name);
    //                    if (data.tag_name !== AppInfo.version) {
    //                        updateDialog.newVerson = data.tag_name;
    //                        updateDialog.body = data.body;
    //                        updateDialog.open();
    //                    } else {
    //                        if (!silent) {
    //                            showInfo(qsTr("The current version is already the latest"));
    //                        }
    //                    }
    //                }
    //     onError: (status, errorString) => {
    //                  if (!silent) {
    //                      showError(qsTr("The network is abnormal"));
    //                  }
    //                  console.debug(status + ";" + errorString);
    //              }
    // }

    Component.onCompleted: checkUpdate(true)
    Component.onDestruction: {
        BaseControls.WindowManager.closeAllWindows();
        BaseControls.WindowManager.quit();
    }
    onLazyLoad: console.log('lazy load')

    function distance(x1, y1, x2, y2) {
        return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    }

    function handleDarkChanged(button) {
        if (FluTools.isMacos() || !FluTheme.animationEnabled) {
            changeDark();
        } else {
            revealLoader.sourceComponent = revealWarpper;
            var target = window.containerItem();
            var pos = button.mapToItem(target, 0, 0);
            var mouseX = pos.x + button.width / 2;
            var mouseY = pos.y + button.height / 2;
            var radius = Math.max(distance(mouseX, mouseY, 0, 0), distance(mouseX, mouseY, target.width, 0), distance(mouseX, mouseY, 0, target.height), distance(mouseX, mouseY, target.width, target.height));
            var reveal = revealLoader.item;
            reveal.start(reveal.width * Screen.devicePixelRatio, reveal.height * Screen.devicePixelRatio, Qt.point(mouseX, mouseY), radius);
        }
    }

    function changeDark() {
        if (FluTheme.dark) {
            FluTheme.darkMode = FluThemeType.Light;
        } else {
            FluTheme.darkMode = FluThemeType.Dark;
        }
    }
    function checkUpdate(silent) {
        console.log('Checking update');
    // callable.silent = silent;
    // Network.get("https://api.github.com/repos/zhuzichu520/FluentUI/releases/latest").go(callable);
    }
}
