import QtQuick
import QtQuick.Controls
import QtQuick.Layoutsvv

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

Item {
    id: control

    anchors.fill: {
        if (parent) {
            return parent;
        }
        return undefined;
    }
}
