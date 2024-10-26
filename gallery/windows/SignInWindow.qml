import QtQuick
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

BaseControls.Window {
    id: window

    title: 'Sign in'
    width: 400
    height: 400

    // fixedSize: true

    ColumnLayout {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        BaseControls.AutoSuggestBox {
            id: emailTextBox
            placeholder: 'someone@example.com'
            Layout.preferredWidth: 260
            Layout.alignment: Qt.AlignHCenter
        }

        BaseControls.TextBox {
            id: passwordTextBox
            Layout.topMargin: 20
            Layout.preferredWidth: 260
            Layout.alignment: Qt.AlignHCenter
            placeholder: 'Passsword'
            echoMode: TextInput.Password
        }

        BaseControls.Button {
            text: 'Sign in'
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 20
            onClicked: {
                if (passwordTextBox.text === '') {
                    // showError('Password is required');
                    return;
                }

                // onResult({
                //     password: passwordTextBox.text
                // });

                window.close();
            }
        }
    }

    onArgumentsInitialized: args => {
        console.log('SignInWindow arguments initialized', args);
    }
}
