import QtQuick
import QtQuick.Controls.Fusion // Fusion changes the appearance of the SpinBox
import QtQuick.Layouts

RowLayout {
    id: root

    property double price : 0
    property string name : "undefined"
    readonly property alias quantity : spinBox.value
    signal quantityUpdated(int newQuantity) // emitted whenever quantity changes

    Layout.fillHeight: true
    Layout.fillWidth: true
    spacing: 10

    Label {
        id: dishLabel
        text: name + ": $" + root.price.toFixed(2)
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
            console.log("Updated dish:", root.name, "; Quantity:", spinBox.value, "; Total $:", root.price * spinBox.value)
            quantityUpdated(spinBox.value)
        }
    }
}
