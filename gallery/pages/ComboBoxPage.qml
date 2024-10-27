import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import RichillCapital.SignalSourceManager.Desktop.Controls.Base as BaseControls

Page {
    id: page

    ColumnLayout {
        BaseControls.ComboBox {
            model: ListModel {
                ListElement {
                    text: 'Item 1'
                }
                ListElement {
                    text: 'Item 2'
                }
                ListElement {
                    text: 'Item 3'
                }
            }
        }

        BaseControls.ComboBox {
            disabled: true
            model: ListModel {
                ListElement {
                    text: "Banana"
                }
                ListElement {
                    text: "Apple"
                }
                ListElement {
                    text: "Coconut"
                }
            }
        }

        BaseControls.ComboBox {
            editable: true
            model: ListModel {
                id: model_3
                ListElement {
                    text: "Banana"
                }
                ListElement {
                    text: "Apple"
                }
                ListElement {
                    text: "Coconut"
                }
            }
            onAccepted: {
                if (find(editText) === -1)
                    model_3.append({
                        text: editText
                    });
            }
        }
    }
}
