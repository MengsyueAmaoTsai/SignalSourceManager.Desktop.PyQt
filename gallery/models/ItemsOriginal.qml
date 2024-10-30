pragma Singleton

import QtQuick
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Object {
    property var navigationView
    property var paneItemMenu

    function rename(item, newName) {
        if (newName && newName.trim().length > 0) {
            item.title = newName;
        }
    }

    BaseControls.NavigationViewItem {
        id: item_home

        count: 9
        title: "Home"
        menuDelegate: paneItemMenu
        infoBadge: BaseControls.Badge {
            count: item_home.count
        }
        // icon: FluentIcons.Home
        url: "qrc:/gallery/pages/HomePage.qml"
        onTap: {
            if (navigationView.getCurrentUrl()) {
                item_home.count = 0;
            }
            navigationView.push(url);
        }
    }
 
    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("PaneItemExpander Disabled")
    //     iconVisible: false
    //     disabled: true
    // }

    // BaseControls.NavigationViewItemExpander {
    //     id: item_expander_basic_input
    //     title: qsTr("Basic Input")
    //     icon: FluentIcons.CheckboxComposite
    //     BaseControls.NavigationViewItem {
    //         id: item_buttons
    //         count: 99
    //         infoBadge: FluBadge {
    //             count: item_buttons.count
    //         }
    //         title: qsTr("Buttons")
    //         menuDelegate: paneItemMenu
    //         extra: ({
    //                 image: "qrc:/example/res/image/control/Button.png",
    //                 recentlyUpdated: true,
    //                 desc: qsTr("A control that responds to user input and raisesa Click event.")
    //             })
    //         url: "qrc:/gallery/pages/T_Buttons.qml"
    //         onTap: {
    //             item_buttons.count = 0;
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         id: item_text
    //         title: qsTr("Text")
    //         menuDelegate: paneItemMenu
    //         count: 5
    //         infoBadge: FluBadge {
    //             count: item_text.count
    //             color: Qt.rgba(82 / 255, 196 / 255, 26 / 255, 1)
    //         }
    //         url: "qrc:/gallery/pages/T_Text.qml"
    //         onTap: {
    //             item_text.count = 0;
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Image")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Image.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Slider")
    //         menuDelegate: paneItemMenu
    //         extra: ({
    //                 image: "qrc:/example/res/image/control/Slider.png",
    //                 recentlyUpdated: true,
    //                 desc: qsTr("A control that lets the user select from a rangeof values by moving a Thumb control along atrack.")
    //             })
    //         url: "qrc:/gallery/pages/T_Slider.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("CheckBox")
    //         menuDelegate: paneItemMenu
    //         extra: ({
    //                 image: "qrc:/example/res/image/control/Checkbox.png",
    //                 recentlyUpdated: true,
    //                 desc: qsTr("A control that a user can select or clear.")
    //             })
    //         url: "qrc:/gallery/pages/T_CheckBox.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("RadioButton")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_RadioButton.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("ToggleSwitch")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_ToggleSwitch.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("GroupBox")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_GroupBox.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("PaneItem Disabled")
    //         disabled: true
    //         icon: FluentIcons.Error
    //     }
    // }

    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("Form")
    //     icon: FluentIcons.GridView
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("TextBox")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_TextBox.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("TimePicker")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_TimePicker.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("DatePicker")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_DatePicker.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("CalendarPicker")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_CalendarPicker.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("ColorPicker")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_ColorPicker.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("ShortcutPicker")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_ShortcutPicker.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    // }

    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("Surface")
    //     icon: FluentIcons.SurfaceHub
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("InfoBar")
    //         menuDelegate: paneItemMenu
    //         extra: ({
    //                 image: "qrc:/example/res/image/control/InfoBar.png",
    //                 recentlyUpdated: true,
    //                 desc: qsTr("An inline message to display app-wide statuschange information.")
    //             })
    //         url: "qrc:/gallery/pages/T_InfoBar.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Progress")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Progress.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("RatingControl")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_RatingControl.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Badge")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Badge.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Rectangle")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Rectangle.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Clip")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Clip.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Carousel")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Carousel.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Expander")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Expander.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Watermark")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Watermark.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    // }

    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("Layout")
    //     icon: FluentIcons.DockLeft
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("StaggeredLayout")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_StaggeredLayout.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("SplitLayout")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_SplitLayout.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("StatusLayout")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_StatusLayout.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    // }

    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("Popus")
    //     icon: FluentIcons.ButtonMenu
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Dialog")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Dialog.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         id: item_combobox
    //         title: qsTr("ComboBox")
    //         menuDelegate: paneItemMenu
    //         count: 9
    //         infoBadge: FluBadge {
    //             count: item_combobox.count
    //             color: Qt.rgba(250 / 255, 173 / 255, 20 / 255, 1)
    //         }
    //         url: "qrc:/gallery/pages/T_ComboBox.qml"
    //         onTap: {
    //             item_combobox.count = 0;
    //             navigationView.push("qrc:/gallery/pages/T_ComboBox.qml");
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Tooltip")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Tooltip.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Menu")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Menu.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Sheet")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Sheet.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    // }

    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("Navigation")
    //     icon: FluentIcons.AllApps
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Pivot")
    //         menuDelegate: paneItemMenu
    //         extra: ({
    //                 image: "qrc:/example/res/image/control/Pivot.png",
    //                 order: 3,
    //                 recentlyAdded: true,
    //                 desc: qsTr("Presents information from different sources in a tabbed view.")
    //             })
    //         url: "qrc:/gallery/pages/T_Pivot.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("BreadcrumbBar")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_BreadcrumbBar.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("TabView")
    //         menuDelegate: paneItemMenu
    //         extra: ({
    //                 image: "qrc:/example/res/image/control/TabView.png",
    //                 order: 1,
    //                 recentlyAdded: true,
    //                 desc: qsTr("A control that displays a collection of tabs thatcan be used to display several documents.")
    //             })
    //         url: "qrc:/gallery/pages/T_TabView.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("TreeView")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_TreeView.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("TableView")
    //         menuDelegate: paneItemMenu
    //         extra: ({
    //                 image: "qrc:/example/res/image/control/DataGrid.png",
    //                 order: 4,
    //                 recentlyAdded: true,
    //                 desc: qsTr("The TableView control provides a flexible way to display a collection of data in rows and columns")
    //             })
    //         url: "qrc:/gallery/pages/T_TableView.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Pagination")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Pagination.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("MultiWindow")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_MultiWindow.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("FlipView")
    //         menuDelegate: paneItemMenu
    //         extra: ({
    //                 image: "qrc:/example/res/image/control/FlipView.png",
    //                 order: 2,
    //                 recentlyAdded: true,
    //                 desc: qsTr("Presents a collection of items that the user canflip through, one item at a time.")
    //             })
    //         url: "qrc:/gallery/pages/T_FlipView.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    // }

    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("Theming")
    //     icon: FluentIcons.Brightness
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Acrylic")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Acrylic.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Theme")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Theme.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Typography")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Typography.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Icons")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Icons.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    // }

    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("Chart")
    //     icon: FluentIcons.AreaChart
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Bar Chart")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/example/qml/chart/T_BarChart.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Line Chart")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/example/qml/chart/T_LineChart.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Pie Chart")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/example/qml/chart/T_PieChart.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Polar Area Chart")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/example/qml/chart/T_PolarAreaChart.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Bubble Chart")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/example/qml/chart/T_BubbleChart.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Scatter Chart")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/example/qml/chart/T_ScatterChart.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Radar Chart")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/example/qml/chart/T_RadarChart.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    // }

    // BaseControls.NavigationViewItemSeparator {
    //     spacing: 10
    //     size: 1
    // }

    // BaseControls.NavigationViewItemExpander {
    //     title: qsTr("Other")
    //     icon: FluentIcons.Shop
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("OpenGL")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_OpenGL.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("QCustomPlot")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_CustomPlot.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("QRCode")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_QRCode.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Tour")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Tour.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Timeline")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Timeline.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Captcha")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Captcha.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Network")
    //         menuDelegate: paneItemMenu
    //         url: "qrc:/gallery/pages/T_Network.qml"
    //         onTap: {
    //             navigationView.push(url);
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         id: item_other
    //         title: qsTr("Remote Loader")
    //         menuDelegate: paneItemMenu
    //         count: 99
    //         infoBadge: FluBadge {
    //             count: item_other.count
    //             color: Qt.rgba(82 / 255, 196 / 255, 26 / 255, 1)
    //         }
    //         url: "qrc:/gallery/pages/T_RemoteLoader.qml"
    //         onTap: {
    //             item_other.count = 0;
    //             navigationView.push("qrc:/gallery/pages/T_RemoteLoader.qml");
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Hot Loader")
    //         onTapListener: function () {
    //             FluRouter.navigate("/hotload");
    //         }
    //     }
    //     BaseControls.NavigationViewItem {
    //         title: qsTr("Test Crash")
    //         onTapListener: function () {
    //             AppInfo.testCrash();
    //         }
    //         Component.onCompleted: {
    //             visible = FluTools.isWin();
    //         }
    //     }
    // }

    // function getRecentlyAddedData() {
    //     var arr = [];
    //     var items = navigationView.getItems();
    //     for (var i = 0; i < items.length; i++) {
    //         var item = items[i];
    //         if (item instanceof BaseControls.NavigationViewItem && item.extra && item.extra.recentlyAdded) {
    //             arr.push(item);
    //         }
    //     }
    //     arr.sort(function (o1, o2) {
    //         return o2.extra.order - o1.extra.order;
    //     });
    //     return arr;
    // }

    // function getRecentlyUpdatedData() {
    //     var arr = [];
    //     var items = navigationView.getItems();
    //     for (var i = 0; i < items.length; i++) {
    //         var item = items[i];
    //         if (item instanceof BaseControls.NavigationViewItem && item.extra && item.extra.recentlyUpdated) {
    //             arr.push(item);
    //         }
    //     }
    //     return arr;
    // }

    // function getSearchData() {
    //     if (!navigationView) {
    //         return;
    //     }
    //     var arr = [];
    //     var items = navigationView.getItems();
    //     for (var i = 0; i < items.length; i++) {
    //         var item = items[i];
    //         if (item instanceof BaseControls.NavigationViewItem) {
    //             if (item.parent instanceof BaseControls.NavigationViewItemExpander) {
    //                 arr.push({
    //                     title: `${item.parent.title} -> ${item.title}`,
    //                     key: item.key
    //                 });
    //             } else
    //                 arr.push({
    //                     title: item.title,
    //                     key: item.key
    //                 });
    //         }
    //     }
    //     return arr;
    // }

    // function startPageByItem(data) {
    //     navigationView.startPageByItem(data);
    // }
}
