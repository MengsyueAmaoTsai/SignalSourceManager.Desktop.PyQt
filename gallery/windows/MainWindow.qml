import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window
    title: "Control Gallery"
    width: 1000
    height: 668
    minimumWidth: 668
    minimumHeight: 320
    // launchMode: FluWindowType.SingleTask
    fitsAppBarWindows: true

    // appBar: FluAppBar {
    //     height: 30
    //     showDark: true
    //     darkClickListener: button => handleDarkChanged(button)
    //     closeClickListener: () => {
    //         dialog_close.open();
    //     }
    //     z: 7
    // }

    // FluentInitializrWindow {
    //     id: fluent_Initializr
    // }

    // FluEvent {
    //     name: "checkUpdate"
    //     onTriggered: {
    //         checkUpdate(false);
    //     }
    // }

    onLazyLoad: console.log('lazy load')

    Component.onCompleted: {
        checkUpdate(true);
    }

    Component.onDestruction: {
        BaseControls.WindowManager.closeAllWindows();
        BaseControls.WindowManager.quit();
    }

    SystemTrayIcon {
        id: system_tray
        visible: true
        icon.source: "qrc:/example/res/image/favicon.ico"
        tooltip: "FluentUI"
        menu: Menu {
            MenuItem {
                text: "退出"
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

    Timer {
        id: timer_window_hide_delay
        interval: 150
        onTriggered: {
            window.hide();
        }
    }

    BaseControls.ContentDialog {
        id: dialog_close
        title: qsTr("Quit")
        message: qsTr("Are you sure you want to exit the program?")
        negativeText: qsTr("Minimize")
        // buttonFlags: FluContentDialogType.NegativeButton | FluContentDialogType.NeutralButton | FluContentDialogType.PositiveButton
        onNegativeClicked: {
            system_tray.showMessage(qsTr("Friendly Reminder"), qsTr("FluentUI is hidden from the tray, click on the tray to activate the window again"));
            timer_window_hide_delay.restart();
        }
        positiveText: qsTr("Quit")
        neutralText: qsTr("Cancel")
        onPositiveClicked: {
            FluRouter.exit(0);
        }
    }

    Component {
        id: nav_item_right_menu
        BaseControls.Menu {
            width: 186
            BaseControls.MenuItem {
                text: qsTr("Open in Separate Window")
                font: AppFont.caption
                onClicked: {
                    FluRouter.navigate("/pageWindow", {
                        title: modelData.title,
                        url: modelData.url
                    });
                }
            }
        }
    }

    Flipable {
        id: flipable
        anchors.fill: parent
        property bool flipped: false
        property real flipAngle: 0
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
                // FluIconButton {
                //     iconSource: FluentIcons.ChromeBack
                //     width: 30
                //     height: 30
                //     iconSize: 13
                //     onClicked: {
                //         flipable.flipped = false;
                //     }
                // }
                // FluIconButton {
                //     iconSource: FluentIcons.Sync
                //     width: 30
                //     height: 30
                //     iconSize: 13
                //     onClicked: {
                //         loader.reload();
                //     }
                // }
                Component.onCompleted: {
                    window.setHitTestVisible(layout_back_buttons);
                }
            }
            // FluRemoteLoader {
            //     id: loader
            //     lazy: true
            //     anchors.fill: parent
            //     souhu-zichu.gitee.io/Qt_174_LieflatPage.qml"
            // }
        }
        front: Item {
            id: page_front
            visible: flipable.flipAngle !== 180
            anchors.fill: flipable
            BaseControls.NavigationView {
                id: nav_view
                property int clickCount: 0
                width: parent.width
                height: parent.height
                z: 999
                //Stack模式，每次切换都会将页面压入栈中，随着栈的页面增多，消耗的内存也越多，内存消耗多就会卡顿，这时候就需要按返回将页面pop掉，释放内存。该模式可以配合FluPage中的launchMode属性，设置页面的启动模式
                //                pageMode: FluNavigationViewType.Stack
                //NoStack模式，每次切换都会销毁之前的页面然后创建一个新的页面，只需消耗少量内存
                pageMode: 'NoStack'
                displayMode: 'Auto'
                // items: ItemsOriginal
                // footerItems: ItemsFooter
                topPadding: {
                    if (window.useSystemAppBar) {
                        return 0;
                    }
                    return FluTools.isMacos() ? 20 : 0;
                }
                title: "FluentUI"
                logo: "qrc:/static/images/favicon.ico"
                onLogoClicked: {
                    clickCount += 1;
                    showSuccess("%1:%2".arg(qsTr("Click Time")).arg(clickCount));
                    if (clickCount === 5) {
                        loader.reload();
                        flipable.flipped = true;
                        clickCount = 0;
                    }
                }
                autoSuggestBox: BaseControls.AutoSuggestBox {
                    // iconSource: FluentIcons.Search
                    // items: ItemsOriginal.getSearchData()
                    placeholderText: qsTr("Search")
                    onItemClicked: data => {
                        ItemsOriginal.startPageByItem(data);
                    }
                }
                Component.onCompleted: {
                    // ItemsOriginal.navigationView = nav_view;
                    // ItemsOriginal.paneItemMenu = nav_item_right_menu;
                    // ItemsFooter.navigationView = nav_view;
                    // ItemsFooter.paneItemMenu = nav_item_right_menu;
                    window.setHitTestVisible(nav_view.buttonMenu);
                    window.setHitTestVisible(nav_view.buttonBack);
                    window.setHitTestVisible(nav_view.imageLogo);
                    setCurrentIndex(0);
                }
            }
        }
    }

    // Component {
    //     id: com_reveal
    //     CircularReveal {
    //         id: reveal
    //         target: window.containerItem()
    //         anchors.fill: parent
    //         darkToLight: FluTheme.dark
    //         onAnimationFinished: {
    //             //动画结束后释放资源
    //             loader_reveal.sourceComponent = undefined;
    //         }
    //         onImageChanged: {
    //             changeDark();
    //         }
    //     }
    // }

    BaseControls.ComponentLoader {
        id: loader_reveal
        anchors.fill: parent
    }

    function distance(x1, y1, x2, y2) {
        return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    }

    function handleDarkChanged(button) {
        if (FluTools.isMacos() || !FluTheme.animationEnabled) {
            changeDark();
        } else {
            loader_reveal.sourceComponent = com_reveal;
            var target = window.containerItem();
            var pos = button.mapToItem(target, 0, 0);
            var mouseX = pos.x + button.width / 2;
            var mouseY = pos.y + button.height / 2;
            var radius = Math.max(distance(mouseX, mouseY, 0, 0), distance(mouseX, mouseY, target.width, 0), distance(mouseX, mouseY, 0, target.height), distance(mouseX, mouseY, target.width, target.height));
            var reveal = loader_reveal.item;
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
        onActivated: {
            tour.open();
        }
    }

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
    //             target: () => nav_view.imageLogo
    //         });
    //         return data;
    //     }
    // }

    // FpsItem {
    //     id: fps_item
    // }

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
        id: dialog_update

        property string newVerson
        property string body

        title: qsTr("Upgrade Tips")
        message: qsTr("FluentUI is currently up to date ") + '{NewVersion}' + qsTr(" -- The current app version") + '{CurrentVersion}' + qsTr(" \nNow go and download the new version？\n\nUpdated content: \n") + body
        // buttonFlags: FluContentDialogType.NegativeButton | FluContentDialogType.PositiveButton
        negativeText: qsTr("Cancel")
        positiveText: qsTr("OK")
        onPositiveClicked: {
            Qt.openUrlExternally("https://github.com/zhuzichu520/FluentUI/releases/latest");
        }
    }

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
    //         var data = JSON.parse(result);
    //         console.debug("current version " + AppInfo.version);
    //         console.debug("new version " + data.tag_name);
    //         if (data.tag_name !== AppInfo.version) {
    //             dialog_update.newVerson = data.tag_name;
    //             dialog_update.body = data.body;
    //             dialog_update.open();
    //         } else {
    //             if (!silent) {
    //                 showInfo(qsTr("The current version is already the latest"));
    //             }
    //         }
    //     }
    //     onError: (status, errorString) => {
    //         if (!silent) {
    //             showError(qsTr("The network is abnormal"));
    //         }
    //         console.debug(status + ";" + errorString);
    //     }
    // }

    function checkUpdate(silent) {
        console.log('Checking update');
    // callable.silent = silent;
    // Network.get("https://api.github.com/repos/zhuzichu520/FluentUI/releases/latest").go(callable);
    }
}
