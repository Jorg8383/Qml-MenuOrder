import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Page {
    id: root

    background: Rectangle {
        color: "lightblue"
        border.color: "black"
    }

    header: Label {
        id: title
        text: root.title
        font.pixelSize: 28
        padding: 4
        horizontalAlignment: Text.AlignHCenter
        Layout.alignment: Qt.AlignHCenter
    }

    Pane {
        anchors.fill: parent
        padding: 10

        ColumnLayout {
            anchors.fill: parent
            spacing: 6

            DishItem {
                name: qsTr("Item 1")
                price: 10
            }
            DishItem {
                name: qsTr("Item 2")
                price: 20
            }
            DishItem {
                name: qsTr("Item 3")
                price: 30
            }
        }
    }
}

// Page {
//     id: root

//     property alias items: menuColumn.children

//     padding: 0
//     spacing: 8
//     background: null

//     header: Label {
//         id: title
//         text: root.title
//         font.pixelSize: 28
//         padding: 4
//     }

//     Pane {
//         anchors.fill: parent
//         padding: 10

//         ColumnLayout {
//             id: menuColumn
//             spacing: 8
//             anchors.fill: parent
//        }
//     }
// }
