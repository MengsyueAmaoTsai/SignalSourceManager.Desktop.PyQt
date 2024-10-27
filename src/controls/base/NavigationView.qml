import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Controls.Basic
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Item {
    id: control

    property string title: 'Untitled NavigationView'
    property url logo

    property list<QtObject> menuItems: []

    // property FluObject footerItems
    // property int pageMode: FluNavigationViewType.Stack

    property int cellHeight: 38
    property int cellWidth: 300
    property int topPadding: 0
    property int widthCompact: 50

    property Component autoSuggestBox: undefined
    // property Component actionItem
    // property FluMenu navItemRightMenu
    // property FluMenu navItemExpanderRightMenu

    //#region FluentUI properties
    property string paneDisplayMode: 'Auto' // Auto | Top | Left | LeftCompact | LeftMinimal

    //#endregion
    Item {
        id: navTopBar
        width: parent.width
        height: visible ? 40 : 0
        anchors {
            top: parent.top
            topMargin: control.topPadding
        }
        visible: true
        z: 999
        RowLayout {
            height: parent.height
            spacing: 0
            BaseControls.Button {
                id: backButton
                text: 'Back'
                Layout.leftMargin: 5
                Layout.alignment: Qt.AlignVCenter
                iconSize: 13
                // iconStart: FluentIcons.ChromeBack
                // disabled:
                onClicked: {
                    context.stackItems = context.stackItems.slice(0, -1);
                    const item = context.stackItems[context.stackItems.length - 1];
                    // if (item._idx < (nav_list.count - layout_footer.count)) {
                    //     layout_footer.currentIndex = -1;
                    // } else {
                    //     layout_footer.currentIndex = item._idx - (nav_list.count - layout_footer.count);
                    // }
                    // nav_list.currentIndex = item._idx;
                    // if (pageMode === FluNavigationViewType.Stack) {
                    //     const nav_stack = loader_content.item.navStack();
                    //     const nav_stack2 = loader_content.item.navStack2();
                    //     nav_stack.pop();
                    //     if (nav_stack.currentItem.launchMode === FluPageType.SingleInstance) {
                    //         const url = nav_stack.currentItem.url;
                    //         const pageIndex = -1;
                    //         for (let i = 0; i < nav_stack2.children.length; i++) {
                    //             const obj = nav_stack2.children[i];
                    //             if (obj.url === url) {
                    //                 pageIndex = i;
                    //                 break;
                    //             }
                    //         }
                    //         if (pageIndex !== -1) {
                    //             nav_stack2.currentIndex = pageIndex;
                    //         }
                    //     }
                    // } else if (pageMode === FluNavigationViewType.NoStack) {
                    //     contentLoader.setSource(item._ext.url, item._ext.argument);
                    // }
                }
            }

            BaseControls.Button {
                id: navButton
                text: 'Nav'
                clip: true
                visible: opacity
                // iconSize: 15
                // iconSource: FluentIcons.GlobalNavButton
                Layout.preferredWidth: control.paneDisplayMode === 'Minimal' ? 30 : 0
                Layout.preferredHeight: 30
                Layout.alignment: Qt.AlignVCenter
                Behavior on opacity {
                    // enabled: AppTheme.enable_animations && d.animDisabled
                    NumberAnimation {
                        duration: 83
                    }
                }
                Behavior on Layout.preferredWidth {
                    // enabled: FluTheme.enable_animations && d.animDisabled
                    NumberAnimation {
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
                onClicked: {
                    console.log('TODO: Implement NavigationView.qml BaseControls.Button.onClicked');
                }
            }
            Image {
                Layout.preferredHeight: 20
                Layout.preferredWidth: 20
                Layout.leftMargin: {
                    if (navButton.visible) {
                        return 12;
                    }
                    return 5;
                }
                Layout.alignment: Qt.AlignVCenter
                sourceSize: Qt.size(40, 40)
                source: control.logo
                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log('LOGO Clicked')
                }
            }
            BaseControls.TextBlock {
                Layout.alignment: Qt.AlignVCenter
                Layout.leftMargin: 12
                text: control.title
                font: AppFont.body
            }
        }
        Item {
            anchors.right: parent.right
            height: parent.height
            width: {
                if (actionLoader.item) {
                    return actionLoader.item.width;
                }
                return 0;
            }

            BaseControls.ComponentLoader {
                id: actionLoader
                anchors.centerIn: parent
                sourceComponent: undefined // property Component actionItem
            }
        }
    }

    BaseControls.ComponentLoader {
        id: contentLoader
        anchors {
            top: navTopBar.bottom
            left: parent.left
            bottom: parent.bottom
            right: parent.right
            leftMargin: {
                if (control.paneDisplayMode === 'Minimal') {
                    return 0;
                }
                if (control.paneDisplayMode === 'LeftCompact') {
                    return control.widthCompact;
                }
                return control.cellWidth;
            }
        }
        sourceComponent: stackContentWrapper

        Behavior on anchors.leftMargin {
            enabled: AppTheme.animation_enabled && context.animationDisabled
            NumberAnimation {
                duration: 167
                easing.type: Easing.OutCubic
            }
        }
    }

    Component {
        id: stackContentWrapper

        Item {
            StackView {
                id: stackView
                anchors.fill: parent
                clip: true
                visible: !stackLayout.visible
                popEnter: Transition {}
                popExit: Transition {}
                pushEnter: Transition {}
                pushExit: Transition {}
                replaceEnter: Transition {}
                replaceExit: Transition {}
            }
            StackLayout {
                id: stackLayout
                anchors.fill: stackView
                clip: true
                visible: {
                    if (!stackView.currentItem) {
                        return false;
                    }
                    // return stackView.currentItem.launchMode === FluPageType.SingleInstance
                    return true;
                }
            }
        }
    }

    Rectangle {
        id: layouts
        width: {
            // if (d.isCompactAndNotPanel) {
            //     return control.navCompactWidth;
            // }
            return control.cellWidth;
        }
        anchors {
            top: parent.top
            bottom: parent.bottom
            topMargin: 0
        }
        border.color: AppTheme.theme === 'Dark' ? Qt.rgba(45 / 255, 45 / 255, 45 / 255, 1) : Qt.rgba(226 / 255, 230 / 255, 234 / 255, 1)
        border.width: {
            // if (d.isMinimal || d.isCompactAndPanel)
            // {
            //     return 1;
            // }

            return 0;
        }
        x: visible ? 0 : -width
        visible: {
            // if (d.displayMode !== FluNavigationViewType.Minimal) {
            //     return true;
            // }
            // return d.isMinimalAndPanel ? true : false;
            return true;
        }
        Behavior on width {
            enabled: AppTheme.animation_enabled && context.animationDisabled
            NumberAnimation {
                duration: 167
                easing.type: Easing.OutCubic
            }
        }
        Behavior on x {
            enabled: AppTheme.animation_enabled && context.animationDisabled
            NumberAnimation {
                duration: 167
                easing.type: Easing.OutCubic
            }
        }
        BaseControls.Shadow {
            radius: 0
            visible: control.paneDisplayMode === 'Minimal' // || d.isCompactAndPanel
        }

        Item {
            id: headerContainer
            width: layouts.width
            clip: true
            y: navTopBar.height + control.topPadding
            height: autoSuggestBox ? 38 : 0

            BaseControls.ComponentLoader {
                id: autoSuggestBoxLoader
                sourceComponent: control.autoSuggestBox
                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: 6
                    rightMargin: 6
                    verticalCenter: parent.verticalCenter
                }
                visible: {
                    // if(d.isCompactAndNotPanel){
                    //     return false
                    // }
                    return true;
                }
            }

            BaseControls.Button {
                // visible:d.isCompactAndNotPanel
                anchors {
                    fill: parent
                    leftMargin: 6
                    rightMargin: 6
                    topMargin: 2
                    bottomMargin: 2
                }
                iconSize: 15
                // iconStart: {
                //     if(loader_auto_suggest_box.item){
                //         return loader_auto_suggest_box.item.autoSuggestBoxReplacement
                //     }
                //     return 0
                // }
                onClicked: console.log('TODO: Implement NavigationView.qml BaseControls.Button.onClicked')
            }
        }

        Flickable {
            id: flickable
            anchors {
                top: headerContainer.bottom
                topMargin: 6
                left: parent.left
                right: parent.right
                bottom: footerContainer.top
            }
            boundsBehavior: ListView.StopAtBounds
            clip: true
            // contentHeight:
            // ScrollBar.vertical:
            ListView {
                id: navItemList
                displaced: Transition {
                    NumberAnimation {
                        properties: "x,y"
                        easing.type: Easing.OutQuad
                    }
                }
                anchors.fill: parent
                interactive: false
                boundsBehavior: ListView.StopAtBounds
                highlightMoveDuration: AppTheme.animation_enabled && context.animationDisabled ? 167 : 0
                highlight: Item {
                    clip: true
                    Rectangle {
                        height: 18
                        radius: 1.5
                        color: AppTheme.primary_color
                        width: 3
                        anchors {
                            verticalCenter: parent.verticalCenter
                            left: parent.left
                            leftMargin: 6
                        }
                    }
                }
                currentIndex: -1
                delegate: BaseControls.ComponentLoader {
                    sourceComponent: {
                        if (navItemList.modelData instanceof BaseControls.NavigationViewItem) {
                            return navItemWrapper;
                        }
                        return undefined;
                    }
                }
                model: context.getMenuItemModel()
            }
        }

        ListView {
            id: footerContainer
            clip: true
            width: layouts.width
            // height:
            anchors.bottom: parent.bottom
            interactive: false
            boundsBehavior: ListView.StopAtBounds
            currentIndex: -1
            // model:
            highlightMoveDuration: 150
            // hightlight:
            delegate:
            // sourceComponent:
            BaseControls.ComponentLoader {}
        }
    }

    BaseControls.ComponentLoader {
        id: itemMenuLoader
    }

    Popup {
        id: popup
        enter: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 83
            }
        }
        padding: 0
        focus: true
        contentItem: Item {
            ListView {
                anchors.fill: parent
                clip: true
                currentIndex: -1
                boundsBehavior: ListView.StopAtBounds
                // model:
                // ScrollBar.vertical:
                delegate: Button {
                    id: itemButton
                    width: 180
                    height: 38
                    focusPolicy: Qt.TabFocus
                    contentItem: BaseControls.TextBlock {
                        text: 'Item---'
                        elide: Text.ElideRight
                        rightPadding: itemDotLoader.width
                        verticalAlignment: Qt.AlignVCenter
                        anchors {
                            verticalCenter: parent.verticalCenter
                        }
                    }
                    background: Rectangle {
                        color: {
                            if (itemButton.hovered) {
                                return AppTheme.item_hover_color;
                            }
                            return AppTheme.item_normal_color;
                        }
                        // FluFocusRectangle {}
                        BaseControls.ComponentLoader {
                            id: itemDotLoader
                            anchors {
                                right: parent.right
                                verticalCenter: parent.verticalCenter
                                rightMargin: 10
                            }
                            sourceComponent: {
                                // if (model.infoBadge) {
                                //     return model.infoBadge;
                                // }
                                return undefined;
                            }
                        }
                    }
                    onClicked: {
                        //
                        popup.close();
                    }
                }
            }
        }
        background: Rectangle {
            implicitWidth: 180
            radius: [4, 4, 4, 4]
            BaseControls.Shadow {
                radius: 4
            }
            color: AppTheme.theme === 'Dark' ? Qt.rgba(51 / 255, 48 / 255, 48 / 255, 1) : Qt.rgba(248 / 255, 250 / 255, 253 / 255, 1)
        }

        Connections {
            target: context
            // function onIsCompactChanged() {}
        }

        function showPopup() {
            popup.open();
        }
    }

    //#region Child controls
    Component {
        id: navItemHeaderWrapper
        Item {
            Text {
                text: 'Header'
            }
        }
    }

    Component {
        id: navItemWrapper

        Item {
            height: {
                //    if(model&&model._parent){
                //         return model._parent.isExpand ? control.cellHeight : 0
                //     }
                return control.cellHeight;
            }
            width: layouts.width
            visible: control.cellHeight === Number(height)
            opacity: visible
            Behavior on opacity {
                NumberAnimation {
                    duration: 83
                }
            }
            Behavior on height {
                enabled: AppTheme.animation_enabled && context.animationDisabled
                NumberAnimation {
                    duration: 167
                    easing.type: Easing.OutCubic
                }
            }

            Text {
                text: 'Item'
            }
        }
    }

    Component {
        id: navItemSeparatorWrapper
        Item {
            Text {
                text: 'Separator'
            }
        }
    }

    //#endregion
    Item {
        id: context

        property bool animationDisabled: false
        property var stackItems: []

        function getMenuItemModel() {
            const result = [];
            if (control.menuItems.length > 0) {
                for (let i = 0; i < control.menuItems.length; i++) {
                    const item = control.menuItems[i];
                    if (!item.visible) {
                        console.log(`Item '${item.content}' is not visible, skipping`);
                        continue;
                    }
                    result.push(item);
                }
            }
            return result;
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        // visible:
        onWheel: {}
        onClicked: console.log('TODO: Implement NavigationView.qml MouseArea.onClicked')
    }
    Component.onCompleted: {
        console.log('TODO: Implement NavigationView.qml Component.onCompleted');
    }

    function setCurrentIndex(index) {
        console.log('TODO: Implement NavigationView.qml setCurrentIndex');
    }
}
