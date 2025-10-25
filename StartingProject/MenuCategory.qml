import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Pane {
    id: category
    width: parent.width / 2
    height: parent.height / 3
    visible: true

    property string categoryName : "undefinedName"
    property var itemNames: ["ItemName1", "ItemName2", "ItemName3"]
    property var itemPrices: ["ItemPrice1", "ItemPrice2", "ItemPrice3"]

    background: Rectangle {
        color: "lightgreen"
    }

    contentItem: Item {
        anchors.fill: parent

        ColumnLayout {
            spacing: 10

            Label {
                text: category.categoryName
                font.pixelSize: 24
            }

            MenuItem {
                id: item1
                price: 10.0
            }

        }

    }
}
