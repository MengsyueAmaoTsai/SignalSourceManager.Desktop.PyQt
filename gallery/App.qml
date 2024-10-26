import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Item {
    id: app

    Component.onCompleted: {
        console.log('Theme:', AppTheme.theme);
        console.log('Render native text:', AppTheme.render_native_text);
        BaseControls.WindowManager.routes = {
            '/': 'qrc:/gallery/windows/MainWindow.qml',
            '/about': 'qrc:/gallery/windows/AboutWindow.qml',
            '/sign-in': 'qrc:/gallery/windows/SignInWindow.qml'
        };
        BaseControls.WindowManager.navigateTo('/sign-in');
    }
}
