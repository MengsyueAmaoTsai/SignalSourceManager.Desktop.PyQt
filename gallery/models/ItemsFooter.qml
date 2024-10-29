pragma Singleton

import QtQuick
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Object {
    id: footer_items

    property var navigationView
    property var paneItemMenu

    // FluPaneItemSeparator {}

    // FluPaneItem {
    //     title: qsTr("About")
    //     icon: FluentIcons.Contact
    //     onTapListener: function () {
    //         FluRouter.navigate("/about");
    //     }
    // }

    // FluPaneItem {
    //     title: qsTr("Settings")
    //     menuDelegate: paneItemMenu
    //     icon: FluentIcons.Settings
    //     url: "qrc:/example/qml/page/T_Settings.qml"
    //     onTap: {
    //         navigationView.push(url);
    //     }
    // }

    // FluPaneItem {
    //     title: qsTr("FluentUI Pro")
    //     menuDelegate: paneItemMenu
    //     icon: FluentIcons.Airplane
    //     url: "qrc:/example/qml/page/T_FluentPro.qml"
    //     onTap: {
    //         navigationView.push(url);
    //     }
    // }
}
