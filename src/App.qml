import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQml
import Qt.labs.platform

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

ApplicationWindow {
    id: root
    visible: true

    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: {
        console.log("ViewModel: " + main_view_model);
    }

    Component.onDestruction: {
        console.log("ViewModel: " + main_view_model);
    }

    ColumnLayout {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        BaseTextBox {
            id: emailField
            Layout.preferredWidth: 260
            Layout.alignment: Qt.AlignHCenter
            placeholderText: 'Please enter your password'
            echoMode: TextInput.Password
        }

        BaseTextBox {
            id: passwordField
            Layout.topMargin: 20
            Layout.preferredWidth: 260
            Layout.alignment: Qt.AlignHCenter
            placeholderText: 'Please enter your password'
            echoMode: TextInput.Password
        }

        BaseButton {
            text: 'Sign in'
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 20
            onClicked: {
                console.log('Sign in clicked');
            }
        }
    }
}
