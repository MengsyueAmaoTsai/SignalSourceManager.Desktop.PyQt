import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: qsTr("Sign in")
    width: 400
    height: 400
    fixSize: true
    modality: Qt.ApplicationModal

    onInitArgument: argument => {
        emailTextBox.updateText(argument.username);
        passwordTextBox.focus = true;
    }

    ColumnLayout {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        BaseControls.AutoSuggestBox {
            id: emailTextBox
            items: [
                {
                    title: "Admin"
                },
                {
                    title: "User"
                }
            ]
            placeholderText: qsTr("Please enter the account")
            Layout.preferredWidth: 260
            Layout.alignment: Qt.AlignHCenter
        }

        BaseControls.TextBox {
            id: passwordTextBox
            Layout.topMargin: 20
            Layout.preferredWidth: 260
            placeholderText: qsTr("Please enter your password")
            echoMode: TextInput.Password
            Layout.alignment: Qt.AlignHCenter
        }

        BaseControls.Button {
            text: "Sign in"
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 20
            onClicked: {
                if (passwordTextBox.text === "") {
                    showError(qsTr("Please feel free to enter a password"));
                    return;
                }
                setResult({
                    password: passwordTextBox.text
                });
                window.close();
            }
        }
    }
}
