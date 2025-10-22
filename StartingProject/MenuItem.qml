import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root
    property double price : 0
    property int quantity: quantity.value
    property string itemName : "undefined"
    signal totalChanged(double total) // emitted whenever quantity changes

    RowLayout {
        spacing: 10

        Label {
            text: qsTr(itemName, ": $" + price.toFixed(2))
            Layout.alignment: Qt.AlignLeft
        }

        SpinBox {
            id: quantity
            stepSize: 1
            from: 0
            to: 10
            value: 0
            onValueChanged: {
                let total = quantity.value * price
                totalChanged(total)
                console.log("Item:", itemName, "Quantity:", quantity.value, "Total $:", total)
            }
            Layout.alignment: Qt.AlignRight
        }

    }

}
