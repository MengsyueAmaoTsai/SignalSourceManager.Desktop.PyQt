import QtQuick
import QtQuick.Controls
import QtQuick.Window
import QtQuick.Layouts

Item {
    id: root

    ColumnLayout {
        NavItem {
            text: 'Home'
            icon: '../../../static/images/home.svg'
        }

        NavItem {
            text: 'Settings'
            icon: '../../../static/images/settings.svg'
        }
    }
}
