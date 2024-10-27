import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: "关于"
    width: 600
    height: 580
    fixSize: true
    // launchMode: FluWindowType.SingleTask

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
                text: "FluentUI"
                font: AppFont.title
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        FluRouter.navigate("/");
                    }
                }
            }
            BaseControls.TextBlock {
                text: "v%1".arg('1.0.0')
                font: AppFont.body
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "作者："
            }
            BaseControls.TextBlock {
                text: "朱子楚"
                Layout.alignment: Qt.AlignBottom
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "微信号："
            }
            BaseControls.TextBlock {
                text: "FluentUI"
                Layout.alignment: Qt.AlignBottom
            }
            BaseControls.TextBlock {
                text: "(有啥问题可能不会马上回，但发了红包必须立马回......)"
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "GitHub："
            }
            // FluTextButton {
            //     id: text_hublink
            //     topPadding: 0
            //     bottomPadding: 0
            //     text: "https://github.com/zhuzichu520/FluentUI"
            //     Layout.alignment: Qt.AlignBottom
            //     onClicked: {
            //         Qt.openUrlExternally(text_hublink.text);
            //     }
            // }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "B站："
            }
            // FluTextButton {
            //     topPadding: 0
            //     bottomPadding: 0
            //     text: "https://www.bilibili.com/video/BV1mg4y1M71w/"
            //     Layout.alignment: Qt.AlignBottom
            //     onClicked: {
            //         Qt.openUrlExternally(text);
            //     }
            // }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                id: text_info
                text: "如果该项目对你有作用，就请点击上方链接给一个免费的star，或者一键三连，谢谢！"
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

        RowLayout {
            spacing: 14
            Layout.topMargin: 20
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: "捐赠："
            }
        }

        Item {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 252
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 30
                Image {
                    width: 250
                    height: 250
                    source: "qrc:/example/res/image/qrcode_wx.jpg"
                }
                Image {
                    width: 250
                    height: 250
                    source: "qrc:/example/res/image/qrcode_zfb.jpg"
                }
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            Layout.topMargin: 20
            BaseControls.TextBlock {
                id: text_desc
                text: "个人开发，维护不易，你们的捐赠就是我继续更新的动力！\n有什么问题提Issues，只要时间充足我就会解决的！！"
            }
        }
    }
}
