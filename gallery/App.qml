import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Item {
    id: app

    height: Screen.height * .7
    width: Screen.width * .7

    Component.onCompleted: {
        console.log('Theme:', AppTheme.theme);
        console.log('Render native text:', AppTheme.render_native_text);
        BaseControls.WindowManager.routes = {
            '/': 'qrc:/gallery/windows/MainWindow.qml',
            '/about': 'qrc:/gallery/windows/AboutWindow.qml',
            '/sign-in': 'qrc:/gallery/windows/SignInWindow.qml',
            '/crash': 'qrc:/gallery/windows/CrashWindow.qml',
            '/single-task': 'qrc:/gallery/windows/SingleTaskWindow.qml',
            '/single-instance': 'qrc:/gallery/windows/SingleInstanceWindow.qml',
            '/page': 'qrc:/gallery/windows/PageWindow.qml',
            '/standard': 'qrc:/gallery/windows/StandardWindow.qml',
            '/hotload': 'qrc:/gallery/windows/HotloadWindow.qml'
        };
        BaseControls.WindowManager.navigateTo('/');
    }
}
