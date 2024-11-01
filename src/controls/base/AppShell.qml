import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Item {
    id: shell

    Component.onCompleted: {
        console.log('AppShell loaded');
    }

    Component.onDestruction: {
        console.log('AppShell destroyed');
    }
}