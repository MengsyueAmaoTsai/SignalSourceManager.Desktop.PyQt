import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: "About"
    width: 600
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
                    onClicked: {
                        FluRouter.navigate("/");
                    }
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
                text: "1.0.0"
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
                text: "3.12"
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
                text: "6.x.x"
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
                id: text_hublink
                topPadding: 0
                bottomPadding: 0
                text: "https://github.com/zhuzichu520/FluentUI"
                Layout.alignment: Qt.AlignBottom
                onClicked: Qt.openUrlExternally(text_hublink.text)
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                id: text_info
                text: "Color animation"
                ColorAnimation {
                    id: animation
                    target: text_info
                    property: "color"
                    from: "red"
                    to: "blue"
                    duration: 1000
                    running: true
                    loops: Animation.Infinite
                    easing.type: Easing.InOutQuad
                }
            }
        }

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
