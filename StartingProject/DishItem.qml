import QtQuick
import QtQuick.Controls.Fusion // Fusion changes the appearance of the SpinBox
import QtQuick.Layouts

RowLayout {
    id: root

    property double price : 0
    property string name : "undefined"
    readonly property double value: root.quantity * root.price
    signal quantityChanged(int newQuantity) // emitted whenever quantity changes

    Layout.fillHeight: true
    Layout.fillWidth: true
    spacing: 10

    Label {
        id: dishLabel
        text: name + ": $" + root.price.toFixed(2)
        font.pixelSize: 18
        Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
    }

    Item { Layout.fillWidth: true } // acts as a flexible spacer

    SpinBox {
        id: spinBox
        stepSize: 1
        from: 0
        to: 10
        Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
        onValueChanged: {
            quantityChanged(spinBox.value)
            console.log("Dish:", root.name, "Value:", root.value)
        }
    }
}
