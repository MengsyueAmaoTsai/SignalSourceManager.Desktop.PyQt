import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Rectangle {
    id: control
    property string title: ""
    property string darkText: qsTr("Dark")
    property string lightText: qsTr("Light")
    property string minimizeText: qsTr("Minimize")
    property string restoreText: qsTr("Restore")
    property string maximizeText: qsTr("Maximize")
    property string closeText: qsTr("Close")
    property string stayTopText: qsTr("Sticky on Top")
    property string stayTopCancelText: qsTr("Sticky on Top cancelled")
    property color textColor: AppTheme.font_primary_color
    property color minimizeNormalColor: AppTheme.item_normal_color
    property color minimizeHoverColor: AppTheme.item_hover_color
    property color minimizePressColor: AppTheme.item_press_color
    property color maximizeNormalColor: AppTheme.item_normal_color
    property color maximizeHoverColor: AppTheme.item_hover_color
    property color maximizePressColor: AppTheme.item_press_color
    property color closeNormalColor: Qt.rgba(0, 0, 0, 0)
    property color closeHoverColor: Qt.rgba(251 / 255, 115 / 255, 115 / 255, 1)
    property color closePressColor: Qt.rgba(251 / 255, 115 / 255, 115 / 255, 0.8)
    property bool showDark: false
    property bool showClose: true
    property bool showMinimize: true
    property bool showMaximize: true
    property bool showStayTop: true
    property bool titleVisible: true
    property url icon
    property int iconSize: 20
    property bool isMac: false
    property color borerlessColor: AppTheme.primary_color
    // property alias buttonStayTop: btn_stay_top
    // property alias buttonMinimize: btn_minimize
    // property alias buttonMaximize: btn_maximize
    // property alias buttonClose: btn_close
    // property alias buttonDark: btn_dark
    property alias layoutMacosButtons: layout_macos_buttons
    property alias layoutStandardbuttons: layout_standard_buttons
    property var maxClickListener: function () {
        if (FluTools.isMacos()) {
            if (d.win.visibility === Window.FullScreen || d.win.visibility === Window.Maximized)
                d.win.showNormal();
            else
                d.win.showFullScreen();
        } else {
            if (d.win.visibility === Window.Maximized || d.win.visibility === Window.FullScreen)
                d.win.showNormal();
            else
                d.win.showMaximized();
            d.hoverMaxBtn = false;
        }
    }
    property var minClickListener: function () {
        if (d.win.transientParent != null) {
            d.win.transientParent.showMinimized();
        } else {
            d.win.showMinimized();
        }
    }
    property var closeClickListener: function () {
        d.win.close();
    }
    property var stayTopClickListener: function () {
        if (d.win instanceof BaseControls.Window) {
            d.win.stayTop = !d.win.stayTop;
        }
    }
    property var darkClickListener: function () {
        if (AppTheme.theme === 'Dark') {
            AppTheme.darkMode = 'Light';
        } else {
            AppTheme.darkMode = 'Dark';
        }
    }
    color: Qt.rgba(0, 0, 0, 0)
    height: visible ? 30 : 0
    opacity: visible
    z: 65535
    Item {
        id: d
        property var hitTestList: []
        property bool hoverMaxBtn: false
        property var win: Window.window
        property bool stayTop: {
            if (d.win instanceof BaseControls.Window) {
                return d.win.stayTop;
            }
            return false;
        }
        property bool isRestore: win && (Window.Maximized === win.visibility || Window.FullScreen === win.visibility)
        property bool resizable: win && !(win.height === win.maximumHeight && win.height === win.minimumHeight && win.width === win.maximumWidth && win.width === win.minimumWidth)
        function containsPointToItem(point, item) {
            var pos = item.mapToGlobal(0, 0);
            var rect = Qt.rect(pos.x, pos.y, item.width, item.height);
            if (point.x > rect.x && point.x < (rect.x + rect.width) && point.y > rect.y && point.y < (rect.y + rect.height)) {
                return true;
            }
            return false;
        }
    }
    Row {
        anchors {
            verticalCenter: parent.verticalCenter
            left: isMac ? undefined : parent.left
            leftMargin: isMac ? undefined : 10
            horizontalCenter: isMac ? parent.horizontalCenter : undefined
        }
        spacing: 10
        Image {
            width: control.iconSize
            height: control.iconSize
            visible: status === Image.Ready ? true : false
            source: control.icon
            anchors.verticalCenter: parent.verticalCenter
        }
        BaseControls.TextBlock {
            text: title
            visible: control.titleVisible
            color: control.textColor
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    Component {
        id: com_macos_buttons
        // FluImageButton {
        //     Layout.preferredHeight: 12
        //     Layout.preferredWidth: 12
        //     normalImage: "../Image/btn_close_normal.png"
        //     hoveredImage: "../Image/btn_close_hovered.png"
        //     pushedImage: "../Image/btn_close_pushed.png"
        //     visible: showClose
        //     onClicked: closeClickListener()
        // }
        // FluImageButton {
        //     Layout.preferredHeight: 12
        //     Layout.preferredWidth: 12
        //     normalImage: "../Image/btn_min_normal.png"
        //     hoveredImage: "../Image/btn_min_hovered.png"
        //     pushedImage: "../Image/btn_min_pushed.png"
        //     onClicked: minClickListener()
        //     visible: showMinimize
        // }
        // FluImageButton {
        //     Layout.preferredHeight: 12
        //     Layout.preferredWidth: 12
        //     normalImage: "../Image/btn_max_normal.png"
        //     hoveredImage: "../Image/btn_max_hovered.png"
        //     pushedImage: "../Image/btn_max_pushed.png"
        //     onClicked: maxClickListener()
        //     visible: d.resizable && showMaximize
        // }
        RowLayout {}
    }
    RowLayout {
        id: layout_standard_buttons
        height: parent.height
        anchors.right: parent.right
        spacing: 0
        // FluIconButton {
        //     id: btn_dark
        //     Layout.preferredWidth: 40
        //     Layout.preferredHeight: 30
        //     padding: 0
        //     verticalPadding: 0
        //     horizontalPadding: 0
        //     rightPadding: 2
        //     iconSource: FluTheme.dark ? FluentIcons.Brightness : FluentIcons.QuietHours
        //     Layout.alignment: Qt.AlignVCenter
        //     iconSize: 15
        //     visible: showDark
        //     text: FluTheme.dark ? control.lightText : control.darkText
        //     radius: 0
        //     iconColor: control.textColor
        //     onClicked: () => darkClickListener(btn_dark)
        // }
        // FluIconButton {
        //     id: btn_stay_top
        //     Layout.preferredWidth: 40
        //     Layout.preferredHeight: 30
        //     padding: 0
        //     verticalPadding: 0
        //     horizontalPadding: 0
        //     iconSource: FluentIcons.Pinned
        //     Layout.alignment: Qt.AlignVCenter
        //     iconSize: 14
        //     visible: {
        //         if (!(d.win instanceof FluWindow)) {
        //             return false;
        //         }
        //         return showStayTop;
        //     }
        //     text: d.stayTop ? control.stayTopCancelText : control.stayTopText
        //     radius: 0
        //     iconColor: d.stayTop ? FluTheme.primaryColor : control.textColor
        //     onClicked: stayTopClickListener()
        // }
        // FluIconButton {
        //     id: btn_minimize
        //     Layout.preferredWidth: 40
        //     Layout.preferredHeight: 30
        //     padding: 0
        //     verticalPadding: 0
        //     horizontalPadding: 0
        //     iconSource: FluentIcons.ChromeMinimize
        //     Layout.alignment: Qt.AlignVCenter
        //     iconSize: 11
        //     text: minimizeText
        //     radius: 0
        //     visible: !isMac && showMinimize
        //     iconColor: control.textColor
        //     color: {
        //         if (pressed) {
        //             return minimizePressColor;
        //         }
        //         return hovered ? minimizeHoverColor : minimizeNormalColor;
        //     }
        //     onClicked: minClickListener()
        // }
        // FluIconButton {
        //     id: btn_maximize
        //     property bool hover: btn_maximize.hovered
        //     Layout.preferredWidth: 40
        //     Layout.preferredHeight: 30
        //     padding: 0
        //     verticalPadding: 0
        //     horizontalPadding: 0
        //     iconSource: d.isRestore ? FluentIcons.ChromeRestore : FluentIcons.ChromeMaximize
        //     color: {
        //         if (down) {
        //             return maximizePressColor;
        //         }
        //         return btn_maximize.hover ? maximizeHoverColor : maximizeNormalColor;
        //     }
        //     Layout.alignment: Qt.AlignVCenter
        //     visible: d.resizable && !isMac && showMaximize
        //     radius: 0
        //     iconColor: control.textColor
        //     text: d.isRestore ? restoreText : maximizeText
        //     iconSize: 11
        //     onClicked: maxClickListener()
        // }
        // FluIconButton {
        //     id: btn_close
        //     Layout.preferredWidth: 40
        //     Layout.preferredHeight: 30
        //     padding: 0
        //     verticalPadding: 0
        //     horizontalPadding: 0
        //     iconSource: FluentIcons.ChromeClose
        //     Layout.alignment: Qt.AlignVCenter
        //     text: closeText
        //     visible: !isMac && showClose
        //     radius: 0
        //     iconSize: 10
        //     iconColor: hovered ? Qt.rgba(1, 1, 1, 1) : control.textColor
        //     color: {
        //         if (pressed) {
        //             return closePressColor;
        //         }
        //         return hovered ? closeHoverColor : closeNormalColor;
        //     }
        //     onClicked: closeClickListener()
        // }
    }
    BaseControls.ComponentLoader {
        id: layout_macos_buttons
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 10
        }
        sourceComponent: isMac ? com_macos_buttons : undefined
    }
}
