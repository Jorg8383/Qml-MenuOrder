import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


Page {
    id: root

    property alias item1 : dishItem1
    property alias item2 : dishItem2
    property alias item3 : dishItem3

    header: Label {
        id: title
        text: root.title
        font.pixelSize: 28
        padding: 10
        horizontalAlignment: Text.AlignLeft
        Layout.alignment: Qt.AlignHCenter
    }

    background: Rectangle {
        color: "grey"
        radius: 8
        opacity: 0.5
    }

    Pane {
        anchors.fill: parent
        padding: 10
        background: null

        ColumnLayout {
            anchors.fill: parent
            spacing: 6

            DishItem {
                id: dishItem1
            }
            DishItem {
                id: dishItem2
            }
            DishItem {
                id: dishItem3
            }
        }
    }
}

