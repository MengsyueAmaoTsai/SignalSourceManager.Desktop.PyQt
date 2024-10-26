import QtQuick
import QtQuick.Controls

import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Item {
    id: app

    Component.onCompleted: {
        console.log('Theme:', AppTheme.theme);
        console.log('Render native text:', AppTheme.render_native_text);
        BaseControls.WindowManager.routes = {
            '/': 'qrc:/src/windows/MainWindow.qml'
        };
        BaseControls.WindowManager.navigateTo('/');
    }
}
