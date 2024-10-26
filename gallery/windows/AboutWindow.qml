import QtQuick.Window
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window
    title: 'About'
    width: 600
    height: 580

    // fixSize: true
    // launchMode: FluWindowType.SingleTask

    ColumnLayout {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        RowLayout {
            Layout.topMargin: 20
            Layout.leftMargin: 15
            spacing: 14

            BaseControls.TextBlock {
                text: 'FluentUI'
                font: AppFont.title

                MouseArea {
                    anchors.fill: parent
                    onClicked: BaseControls.WindowManager.navigateTo('/')
                }
            }

            BaseControls.TextBlock {
                Layout.alignment: Qt.AlignBottom
                text: 'v%1'.arg('1.0.0')
                font: AppFont.body
            }
        }

        RowLayout {
            spacing: 14
            Layout.topMargin: 20
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: 'Developed by:'
            }

            BaseControls.TextBlock {
                text: 'Mengsyue Amao Tsai'
                Layout.alignment: Qt.AlignBottm
            }
        }

        RowLayout {
            spacing: 14
            Layout.leftMargin: 15
            BaseControls.TextBlock {
                text: 'GitHub:'
            }
            BaseControls.Button {
                id: githubLink
                topPadding: 0
                bottomPadding: 0
                text: 'https://github.com/MengsyueAmaoTsai/SignalSourceManager.Desktop.PyQt'
                Layout.alignment: Qt.AlignBottom
                onClicked: Qt.openUrlExternally(githubLink.text)
            }
        }
    }
}
