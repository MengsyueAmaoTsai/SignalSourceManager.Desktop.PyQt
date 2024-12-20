import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Window {
    id: window

    property var arguments: ({})
    property var windowRegister: undefined
    property string route: ''

    default property alias contentData: layout_content.data
    property string windowIcon: 'qrc:/static/images/favicon.ico'
    property string launchMode: 'Standard'
    property var background: com_background
    property bool fixSize: false
    property Component loadingItem: com_loading
    property bool fitsAppBarWindows: false
    property var tintOpacity: AppTheme.theme === 'Dark' ? 0.80 : 0.75
    property int blurRadius: 60
    // property alias effect: frameless.effect
    // readonly property alias effective: frameless.effective
    // readonly property alias availableEffects: frameless.availableEffects
    property Item appBar: BaseControls.AppTitleBar {
        title: window.title
        height: 30
        showDark: window.showDark
        showClose: window.showClose
        showMinimize: window.showMinimize
        showMaximize: window.showMaximize
        showStayTop: window.showStayTop
        icon: window.windowIcon
    }
    property color backgroundColor: {
        // if (frameless.effective && active) {
        //     var backcolor;
        //     if (frameless.effect === "dwm-blur")
        //       backcolor = FluTools.withOpacity(FluTheme.windowActiveBackgroundColor, window.tintOpacity);
        //     {} else {
        //         backcolor = "transparent";
        //     }
        //     return backcolor;
        // }
        if (active) {
            return AppTheme.window_active_background_color;
        }
        return AppTheme.window_background_color;
    }
    property bool stayTop: false
    property bool showDark: false
    property bool showClose: true
    property bool showMinimize: true
    property bool showMaximize: true
    property bool showStayTop: false
    property bool autoMaximize: false
    property bool autoVisible: true
    property bool autoCenter: true
    property bool autoDestroy: true
    property bool useSystemAppBar
    property int __margins: 0
    property color resizeBorderColor: {
        if (window.active) {
            return AppTheme.theme === 'Dark' ? Qt.rgba(51 / 255, 51 / 255, 51 / 255, 1) : Qt.rgba(110 / 255, 110 / 255, 110 / 255, 1);
        }
        return AppTheme.theme === 'Dark' ? Qt.rgba(61 / 255, 61 / 255, 61 / 255, 1) : Qt.rgba(167 / 255, 167 / 255, 167 / 255, 1);
    }
    property int resizeBorderWidth: 1
    property var closeListener: function (event) {
        if (autoDestroy) {
            BaseControls.WindowManager.removeWindow(window);
        } else {
            window.visibility = Window.Hidden;
            event.accepted = false;
        }
    }
    signal initArgument(var argument)
    signal lazyLoad

    property bool _hideShadow: false
    // color: FluTools.isSoftware() ? window.backgroundColor : "transparent"
    Component.onCompleted: {
        BaseControls.WindowManager.addWindow(window);
        // useSystemAppBar = FluApp.useSystemAppBar;
        useSystemAppBar = true;
        if (!useSystemAppBar && autoCenter) {
            moveWindowToDesktopCenter();
        }
        fixWindowSize();
        initArgument(window.arguments);
        if (window.autoVisible) {
            if (window.autoMaximize) {
                window.visibility = Window.Maximized;
            } else {
                window.show();
            }
        }
    }
    onVisibleChanged: {
        if (visible && d.isLazyInit) {
            window.lazyLoad();
            d.isLazyInit = false;
        }
    }
    QtObject {
        id: d
        property bool isLazyInit: true
    }
    Connections {
        target: window
        function onClosing(event) {
            closeListener(event);
        }
    }
    // FluFrameless {
    //     id: frameless
    //     appbar: window.appBar
    //     maximizeButton: appBar.buttonMaximize
    //     fixSize: window.fixSize
    //     topmost: window.stayTop
    //     disabled: FluApp.useSystemAppBar
    //     isDarkMode: AppTheme.theme === 'Dark'
    //     useSystemEffect: !FluTheme.blurBehindWindowEnabled
    //     Component.onCompleted: {
    //         frameless.setHitTestVisible(appBar.layoutMacosButtons);
    //         frameless.setHitTestVisible(appBar.layoutStandardbuttons);
    //     }
    //     Component.onDestruction: {
    //         frameless.onDestruction();
    //     }
    //     onEffectiveChanged: {
    //         if (effective) {
    //             FluTheme.blurBehindWindowEnabled = false;
    //         }
    //     }
    // }
    Component {
        id: com_background
        Item {
            Rectangle {
                anchors.fill: parent
                color: window.backgroundColor
            }
            Image {
                id: img_back
                visible: false
                cache: false
                fillMode: Image.PreserveAspectCrop
                asynchronous: true
                Component.onCompleted: {
                    img_back.updateLayout();
                    // source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath);
                }
                Connections {
                    target: window
                    function onScreenChanged() {
                        img_back.updateLayout();
                    }
                }
                function updateLayout() {
                // var geometry = FluTools.desktopAvailableGeometry(window);
                // img_back.width = geometry.width;
                // img_back.height = geometry.height;
                // img_back.sourceSize = Qt.size(img_back.width, img_back.height);
                }
                Connections {
                    target: AppTheme
                    function onDesktopImagePathChanged() {
                        timer_update_image.restart();
                    }
                    function onBlurBehindWindowEnabledChanged() {
                        if (FluTheme.blurBehindWindowEnabled) {
                            img_back.source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath);
                        } else {
                            img_back.source = "";
                        }
                    }
                }
                Timer {
                    id: timer_update_image
                    interval: 150
                    onTriggered: {
                        img_back.source = "";
                        img_back.source = FluTools.getUrlByFilePath(FluTheme.desktopImagePath);
                    }
                }
            }
            BaseControls.Acrylic {
                anchors.fill: parent
                target: img_back
                tintOpacity: window.tintOpacity
                blurRadius: window.blurRadius
                visible: window.active && AppTheme.blur_behind_window_enabled
                tintColor: AppTheme.theme === 'Dark' ? Qt.rgba(0, 0, 0, 1) : Qt.rgba(1, 1, 1, 1)
                targetRect: Qt.rect(window.x - window.screen.virtualX, window.y - window.screen.virtualY, window.width, window.height)
            }
        }
    }
    Component {
        id: com_app_bar
        Item {
            data: window.appBar
            Component.onCompleted: {
                window.appBar.width = Qt.binding(function () {
                    return this.parent.width;
                });
            }
        }
    }
    Component {
        id: com_loading
        Popup {
            id: popup_loading
            focus: true
            width: window.width
            height: window.height
            anchors.centerIn: Overlay.overlay
            closePolicy: {
                if (cancel) {
                    return Popup.CloseOnEscape | Popup.CloseOnPressOutside;
                }
                return Popup.NoAutoClose;
            }
            Overlay.modal: Item {}
            onVisibleChanged: {
                if (!visible) {
                    loader_loading.sourceComponent = undefined;
                }
            }
            padding: 0
            opacity: 0
            visible: true
            Behavior on opacity {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 83
                    }
                    NumberAnimation {
                        duration: 167
                    }
                }
            }
            Component.onCompleted: {
                opacity = 1;
            }
            background: Rectangle {
                color: "#44000000"
            }
            contentItem: Item {
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (cancel) {
                            popup_loading.visible = false;
                        }
                    }
                }
                ColumnLayout {
                    spacing: 8
                    anchors.centerIn: parent
                    // FluProgressRing {
                    //     Layout.alignment: Qt.AlignHCenter
                    // }
                    BaseControls.TextBlock {
                        text: loadingText
                        Layout.alignment: Qt.AlignHCenter
                    }
                }
            }
        }
    }
    Component {
        id: com_border
        Rectangle {
            color: "transparent"
            border.width: window.resizeBorderWidth
            border.color: window.resizeBorderColor
        }
    }
    Item {
        id: layout_container
        anchors.fill: parent
        anchors.margins: window.__margins
        BaseControls.ComponentLoader {
            anchors.fill: parent
            sourceComponent: background
        }
        BaseControls.ComponentLoader {
            id: loader_app_bar
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            height: {
                if (window.useSystemAppBar) {
                    return 0;
                }
                return window.fitsAppBarWindows ? 0 : window.appBar.height;
            }
            sourceComponent: window.useSystemAppBar ? undefined : com_app_bar
        }
        Item {
            id: layout_content
            anchors {
                top: loader_app_bar.bottom
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            clip: true
        }
        BaseControls.ComponentLoader {
            id: loader_loading
            property string loadingText
            property bool cancel: false
            anchors.fill: parent
        }
        BaseControls.InfoBar {
            id: info_bar
            root: layout_container
        }
        BaseControls.ComponentLoader {
            id: loader_border
            anchors.fill: parent
            sourceComponent: {
                if (window.useSystemAppBar || window.visibility === Window.Maximized || window.visibility === Window.FullScreen) {
                    return undefined;
                }
                return com_border;
            }
        }
    }
    function hideLoading() {
        loader_loading.sourceComponent = undefined;
    }
    function showSuccess(text, duration, moremsg) {
        return info_bar.showSuccess(text, duration, moremsg);
    }
    function showInfo(text, duration, moremsg) {
        return info_bar.showInfo(text, duration, moremsg);
    }
    function showWarning(text, duration, moremsg) {
        return info_bar.showWarning(text, duration, moremsg);
    }
    function showError(text, duration, moremsg) {
        return info_bar.showError(text, duration, moremsg);
    }
    function clearAllInfo() {
        return info_bar.clearAllInfo();
    }
    function moveWindowToDesktopCenter() {
    // var availableGeometry = FluTools.desktopAvailableGeometry(window);
    // window.setGeometry((availableGeometry.width - window.width) / 2 + Screen.virtualX, (availableGeometry.height - window.height) / 2 + Screen.virtualY, window.width, window.height);
    }
    function fixWindowSize() {
        if (fixSize) {
            window.maximumWidth = window.width;
            window.maximumHeight = window.height;
            window.minimumWidth = window.width;
            window.minimumHeight = window.height;
        }
    }
    function setResult(data) {
        if (windowRegister) {
            windowRegister.setResult(data);
        }
    }
    function showMaximized() {
        frameless.showMaximized();
    }
    function showMinimized() {
        frameless.showMinimized();
    }
    function showNormal() {
        frameless.showNormal();
    }
    function showLoading(text = "", cancel = true) {
        if (text === "") {
            text = qsTr("Loading...");
        }
        loader_loading.loadingText = text;
        loader_loading.cancel = cancel;
        loader_loading.sourceComponent = com_loading;
    }
    function setHitTestVisible(val) {
    // frameless.setHitTestVisible(val);
    }
    function deleteLater() {
    // FluTools.deleteLater(window);
    }
    function containerItem() {
        return layout_container;
    }
}
