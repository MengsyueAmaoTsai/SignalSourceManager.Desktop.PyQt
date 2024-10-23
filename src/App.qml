import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window

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
        RowLayout {
            Button {
                text: 'Start SignalR connection'
                onClicked: {
                    main_view_model.start_signal_r_connection();
                }
            }

            Button {
                text: 'Stop SignalR connection'
                onClicked: {
                    main_view_model.stop_signal_r_connection();
                }
            }

            Button {
                text: 'Send SignalR message'
                onClicked: {
                    main_view_model.send_signal_r_message();
                }
            }
        }

        RowLayout {
            Button {
                text: 'Start File monitor service'
                onClicked: {
                    main_view_model.start_file_monitor_service();
                }
            }

            Button {
                text: 'Stop File monitor service'
                onClicked: {
                    main_view_model.stop_file_monitor_service();
                }
            }
        }
    }
}
