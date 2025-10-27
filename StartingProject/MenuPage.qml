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

            Rectangle {
                color: "grey"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Rectangle {
                color: "blue"
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Rectangle {
                color: "brown"
                Layout.fillHeight: true
                Layout.fillWidth: true
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
