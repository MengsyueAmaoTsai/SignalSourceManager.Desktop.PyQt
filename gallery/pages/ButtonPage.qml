import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Page {
    QtObject {
        id: context

        property bool isLoading: false
    }
    Column {
        spacing: 10
        anchors.centerIn: parent

        // Basic button
        BaseControls.Button {
            id: basicButton
            text: 'Button'
            onClicked: console.log('Button clicked')
        }

        // Accent button
        BaseControls.Button {
            id: accentButton
            text: 'Accent Button'
            appearance: 'Accent'
            onClicked: console.log('Accent button clicked')
        }

        // Lightweight button
        BaseControls.Button {
            id: lightweightButton
            text: 'Lightweight Button'
            appearance: 'Lightweight'
            onClicked: console.log('Lightweight button clicked')
        }

        // Outline button
        BaseControls.Button {
            id: outlineButton
            text: 'Outline Button'
            appearance: 'Outline'
            onClicked: console.log('Outline button clicked')
        }

        // Stealth button
        BaseControls.Button {
            id: stealthButton
            text: 'Stealth Button'
            appearance: 'Stealth'
            onClicked: console.log('Stealth button clicked')
        }

        // Colored button
        BaseControls.Button {
            id: coloredButton
            text: 'Colored Button'
            backgroundColor: 'red'
            color: 'red'
            onClicked: console.log('Colored button clicked')
        }

        // Loading button
        BaseControls.Button {
            id: loadingButton
            text: 'Loading Button'
            loading: context.isLoading
            onClicked: console.log('Loading button clicked', context.isLoading)
        }
    }
}
