import QtQuick
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

BaseWindow {
    id: window
    title: 'About'
    width: 600
    height: 580

    ColumnLayout {
        spacing: 5

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseText {
                text: 'Version:'
            }

            BaseText {
                text: app_info.version
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseText {
                text: 'Python version:'
            }

            BaseText {
                text: app_info.python_version
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseText {
                text: 'Qt version:'
            }

            BaseText {
                text: app_info.qt_version
                Layout.alignment: Qt.AlignBottom
            }
        }
    }
}
