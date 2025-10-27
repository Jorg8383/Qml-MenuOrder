import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


RowLayout {
    id: root

    property double price : 0
    property string name : "undefined"
    readonly property double value: root.quantity * root.price
    signal quantityChanged(int newQuantity) // emitted whenever quantity changes

    spacing: 10

    Label {
        text: name + ": $" + root.price.toFixed(2)
        font.pixelSize: 18
    }

    SpinBox {
        id: spinBox
        stepSize: 1
        from: 0
        to: 10
        onValueChanged: {
            quantityChanged(spinBox.value)
            console.log("Dish:", root.name, "Value:", root.value)
        }
    }
}
