import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Rectangle {
    id: control

    color: Qt.rgba(0, 0, 0, 0)
    height: visible ? 30 : 0
    opacity: visible
    z: 65535

    property string title: ''
    property url icon
    property int iconSize: 20

    property string darkText: "Dark"
    property string lightText: "Light"
    property string minimizeText: "Minimize"
    property string restoreText: "Restore"
    property string maximizeText: "Maximize"
    property string closeText: "Close"
    property string stayTopText: "Sticky on Top"
    property string stayTopCancelText: "Sticky on Top cancelled"

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

    property bool isMac: false
    property color borerlessColor: AppTheme.primary_color

    property alias buttonStayTop: stayOnTopButton
    property alias buttonMinimize: minimizeButton
    property alias buttonMaximize: maximizeButton
    property alias buttonClose: btn_close
    property alias buttonDark: themeSwitchingButton
    property alias layoutStandardbuttons: standardButtonsLayout

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

    RowLayout {
        id: standardButtonsLayout

        height: parent.height
        anchors.right: parent.right
        spacing: 0

        BaseControls.Button {
            id: themeSwitchingButton

            // iconSize: 15
            // iconColor: control.textColor
            // iconSource: AppTheme.theme === 'Dark' ? FluentIcons.Brightness : FluentIcons.QuietHours

            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            padding: 0
            verticalPadding: 0
            horizontalPadding: 0
            rightPadding: 2
            visible: showDark
            text: AppTheme.theme === 'Dark' ? control.lightText : control.darkText
            // radius: 0
            onClicked: () => darkClickListener(themeSwitchingButton)
        }
        BaseControls.Button {
            id: stayOnTopButton

            // iconSize: 14
            // iconSource: FluentIcons.Pinned
            // iconColor: d.stayTop ? FluTheme.primaryColor : control.textColor

            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter
            padding: 0
            verticalPadding: 0
            horizontalPadding: 0
            visible: {
                if (!(d.win instanceof BaseControls.Window)) {
                    return false;
                }
                return showStayTop;
            }
            text: d.stayTop ? control.stayTopCancelText : control.stayTopText
            // radius: 0
            onClicked: stayTopClickListener()
        }
        BaseControls.Button {
            id: minimizeButton

            // iconColor: control.textColor
            // iconSize: 11
            // iconSource: FluentIcons.ChromeMinimize

            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter

            padding: 0
            verticalPadding: 0
            horizontalPadding: 0
            text: minimizeText
            // radius: 0
            visible: !isMac && showMinimize
            // color: {
            //     if (pressed) {
            //         return minimizePressColor;
            //     }
            //     return hovered ? minimizeHoverColor : minimizeNormalColor;
            // }
            onClicked: minClickListener()
        }
        BaseControls.Button {
            id: maximizeButton

            // iconSource: d.isRestore ? FluentIcons.ChromeRestore : FluentIcons.ChromeMaximize
            // iconSize: 11
            // iconColor: control.textColor

            Layout.preferredWidth: 40
            Layout.preferredHeight: 30

            text: d.isRestore ? restoreText : maximizeText
            padding: 0
            verticalPadding: 0
            horizontalPadding: 0
            // color: {
            //     if (down) {
            //         return maximizePressColor;
            //     }
            //     return maximizeButton.hover ? maximizeHoverColor : maximizeNormalColor;
            // }
            Layout.alignment: Qt.AlignVCenter
            visible: d.resizable && !isMac && showMaximize
            // radius: 0
            property bool hover: maximizeButton.hovered
            onClicked: maxClickListener()
        }
        BaseControls.Button {
            id: btn_close

            // iconColor: hovered ? Qt.rgba(1, 1, 1, 1) : control.textColor
            // iconSource: FluentIcons.ChromeClose
            // iconSize: 10

            Layout.preferredWidth: 40
            Layout.preferredHeight: 30
            Layout.alignment: Qt.AlignVCenter

            padding: 0
            verticalPadding: 0
            horizontalPadding: 0
            text: closeText
            visible: !isMac && showClose
            // radius: 0
            // color: {
            //     if (pressed) {
            //         return closePressColor;
            //     }
            //     return hovered ? closeHoverColor : closeNormalColor;
            // }
            onClicked: closeClickListener()
        }
    }
}
