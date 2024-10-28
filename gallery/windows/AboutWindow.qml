import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: "About"
    width: 800
    height: 580
    fixSize: true
    launchMode: 'SingleTask'

    ColumnLayout {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        spacing: 5

        RowLayout {
            Layout.topMargin: 10
            Layout.leftMargin: 15
            spacing: 14
            BaseControls.TextBlock {
                text: window.title
                font: AppFont.title
                MouseArea {
                    anchors.fill: parent
                    onClicked: BaseControls.WindowManager.navigateTo("/")
                }
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "Version"
            }
            BaseControls.TextBlock {
                text: AppInfo.version
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "Python version"
            }
            BaseControls.TextBlock {
                text: AppInfo.python_version
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "Qt version"
            }
            BaseControls.TextBlock {
                text: AppInfo.qt_version
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "GitHub："
            }

            // Text link button
            BaseControls.Button {
                id: githubLinkButton

                topPadding: 0
                bottomPadding: 0
                text: AppInfo.repository
                Layout.alignment: Qt.AlignBottom
                onClicked: Qt.openUrlExternally(githubLinkButton.text)
            }
        }

        // QR Core demo
        // Item {
        //     Layout.preferredWidth: parent.width
        //     Layout.preferredHeight: 252
        //     Row {
        //         anchors.horizontalCenter: parent.horizontalCenter
        //         spacing: 30
        //         Image {
        //             width: 250
        //             height: 250
        //             source: "qrc:/gallery/assets/images/qrcode_wx.jpg"
        //         }
        //         Image {
        //             width: 250
        //             height: 250
        //             source: "qrc:/gallery/assets/images/qrcode_zfb.jpg"
        //         }
        //     }
        // }
    }
}
