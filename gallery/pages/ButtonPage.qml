import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Page {
    QtObject {
        id: context

        property bool isLoading: false
    }

    ColumnLayout {
        id: pageLayout

        BaseControls.TextBlock {
            text: 'Button Examples'
            font: AppFont.title
        }

        ColumnLayout {
            id: contentLayout

            BaseControls.TextBlock {
                text: 'Simple button examples'
                font: AppFont.subtitle
            }

            RowLayout {
                // Basic
                BaseControls.Button {
                    id: basicButton
                    text: 'Button'
                    onClicked: console.log('Basic button clicked')
                }

                // Accent
                BaseControls.Button {
                    id: accentButton
                    text: 'Accent'
                    appearance: 'Accent'
                    onClicked: console.log('Accent button clicked')
                }

                // Colored
                BaseControls.Button {
                    id: coloredButton
                    text: 'Colored'
                    textColor: 'red'
                    // backgroundColor: 'blue'
                    onClicked: console.log(`Colored button with text color: ${textColor} clicked`)
                }
            }

            BaseControls.TextBlock {
                text: 'With content and icon'
                font: AppFont.subtitle
            }

            RowLayout {
                BaseControls.Button {
                    text: 'Button'
                    iconStart: 'qrc:/static/images/favicon.ico'
                }
                BaseControls.Button {
                    text: 'Button'
                    iconStart: 'qrc:/static/images/favicon.ico'
                    appearance: 'Accent'
                }
                BaseControls.Button {
                    text: 'Button'
                    iconEnd: 'qrc:/static/images/favicon.ico'
                }
                BaseControls.Button {
                    text: 'Button'
                    iconEnd: 'qrc:/static/images/favicon.ico'
                    appearance: 'Accent'
                }
                BaseControls.Button {
                    iconEnd: 'qrc:/static/images/favicon.ico'
                    // title: 'Globe'
                }
                BaseControls.Button {
                    text: 'Refresh'
                    iconStart: 'qrc:/static/images/favicon.ico'
                    loading: context.isLoading
                    onClicked: console.log('StartLoadingAsync')
                }
                BaseControls.Button {
                    text: 'Refresh'
                    iconStart: 'qrc:/static/images/favicon.ico'
                    loading: context.isLoading
                    appearance: 'Accent'
                    onClicked: consol.log('StartLoadingAsync')
                }
            }
        }
    }
}
