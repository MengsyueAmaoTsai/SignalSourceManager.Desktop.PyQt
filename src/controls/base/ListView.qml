Rectangle {
    id: control

    property var itemSources: []
    property var selectedItem: undefined

    QtObject {
        id: internal
    }

    Component.onCompleted: {
        for (let i = 0; i < itemSources.length; i++) {
            // Create component for each item and display it
            const item = itemSources[i];

            console.log('ListItem:', item);
        }
    }
}
