import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts


RowLayout {
    id: root
    property double price : 0
    property alias quantity: 0
    property string itemName
    readonly property double value: root.quantity * root.price
    signal quantityChanged(int newQuantity) // emitted whenever quantity changes

    spacing: 10

    Label {
        text: itemName + ": $" + root.price.toFixed(2)
        font.pixelSize: 18
        Layout.fillWidth: true
    }

    SpinBox {
        id: spinBox
        stepSize: 1
        from: 0
        to: 10
        value: root.quantity
        onValueChanged: {
            root.quantity = spinBox.value
            quantityChanged(spinBox.value)
            console.log("Item:", root.itemName, "Quantity:", root.quantity)
        }
        Layout.alignment: Qt.AlignVCenter
    }
}
