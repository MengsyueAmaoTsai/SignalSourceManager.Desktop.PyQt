import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Item {
    id: control
    default property alias content: container.data
    property string statusMode: 'Loading'
    property string loadingText: qsTr("Loading...")
    property string emptyText: qsTr("Empty")
    property string errorText: qsTr("Error")
    property string errorButtonText: qsTr("Reload")
    property color color: Qt.rgba(0, 0, 0, 0)
    signal errorClicked
    property Component loadingItem: com_loading
    property Component emptyItem: com_empty
    property Component errorItem: com_error

    Item {
        id: container
        anchors.fill: parent
        visible: statusMode === 'Success'
    }
    BaseControls.ComponentLoader {
        id: loader
        anchors.fill: parent
        visible: statusMode !== 'Success'
        sourceComponent: {
            if (statusMode === 'Loading') {
                return loadingItem;
            }
            if (statusMode === 'Empty') {
                return emptyItem;
            }
            if (statusMode === 'Error') {
                return errorItem;
            }
            return undefined;
        }
    }
    Component {
        id: com_loading
        BaseControls.Frame {
            padding: 0
            border.width: 0
            radius: 0
            color: control.color
            ColumnLayout {
                anchors.centerIn: parent
                // FluProgressRing {
                //     indeterminate: true
                //     Layout.alignment: Qt.AlignHCenter
                // }
                BaseControls.TextBlock {
                    text: control.loadingText
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
    Component {
        id: com_empty
        BaseControls.Frame {
            padding: 0
            border.width: 0
            radius: 0
            color: control.color
            ColumnLayout {
                anchors.centerIn: parent
                BaseControls.TextBlock {
                    text: control.emptyText
                    font: AppFont.body_strong
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }
    Component {
        id: com_error
        BaseControls.Frame {
            padding: 0
            border.width: 0
            radius: 0
            color: control.color
            ColumnLayout {
                anchors.centerIn: parent
                BaseControls.TextBlock {
                    text: control.errorText
                    font: FluTextStyle.BodyStrong
                    Layout.alignment: Qt.AlignHCenter
                }
                // FluFilledButton{
                //     id:btn_error
                //     Layout.alignment: Qt.AlignHCenter
                //     text:control.errorButtonText
                //     onClicked:{
                //         control.errorClicked()
                //     }
                // }
            }
        }
    }
    function showSuccessView() {
        statusMode = FluStatusLayoutType.Success;
    }
    function showLoadingView() {
        statusMode = FluStatusLayoutType.Loading;
    }
    function showEmptyView() {
        statusMode = FluStatusLayoutType.Empty;
    }
    function showErrorView() {
        statusMode = FluStatusLayoutType.Error;
    }
}
