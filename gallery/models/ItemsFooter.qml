pragma Singleton

import QtQuick
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Object {
    id: footer_items

    property var navigationView
    property var paneItemMenu

    // BaseControls.NavigationViewItemSeparator {}

    BaseControls.NavigationViewItem {
        title: "About"
        // icon: FluentIcons.Contact
        onTapListener: function () {
            BaseControls.WindowManager.navigateTo("/about");
        }
    }

    BaseControls.NavigationViewItem {
        title: "Settings"
        menuDelegate: paneItemMenu
        // icon: FluentIcons.Settings
        url: "qrc:/example/qml/page/T_Settings.qml"
        onTap: navigationView.push(url)
    }

    BaseControls.NavigationViewItem {
        title: "FluentUI Pro"
        menuDelegate: paneItemMenu
        // icon: FluentIcons.Airplane
        url: "qrc:/example/qml/page/T_FluentPro.qml"
        onTap: navigationView.push(url)
    }
}
