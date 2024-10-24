import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

import RichillCapital.SignalSourceManager.Desktop.Controls.Base

ApplicationWindow {
    id: root
    visible: true

    width: Screen.width * 0.8
    height: Screen.height * 0.8

    Component.onCompleted: {
        console.log("ViewModel: " + main_view_model);
        loadData();
    }

    Component.onDestruction: {
        console.log("ViewModel: " + main_view_model);
    }

    BaseTable {
        id: signalSourceTable

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        columnSource: [
            {
                title: 'Id',
                dataIndex: 'id',
                width: 80
            },
            {
                title: 'Name',
                dataIndex: 'name',
                width: 100
            },
        ]
    }

    function loadData() {
        signalSourceTable.itemSource = main_view_model.signal_sources;
        console.log('Item source: ', signalSourceTable.itemSource.length);
    }
}
