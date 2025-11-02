import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Layouts
import "orderUtils.js" as OrderUtils

ApplicationWindow {
    id: window


    /* Your menu ordering application should contain the following:

        - A variety of Controls from the Qt Quick Controls module
          such as Page, Pane, Button, Slider, RadioButton or Dials.
        - An ApplicationWindow that has a suitably appetising background
        - A cuisine-themed font to use across your whole design.
        - A restaurant name that you can put in the ApplicationWindow header.
        - Customise the ApplicationWindow palette to adjust your Controls' colors
        - Organise your menu into visual Pages with titles for Starters, Mains and Desserts,
          listing some menu items, showing a price and a quantity selection.
        - The total cost of the selected items should be shown in the ApplicationWindow footer
        - Consider how your design could be made from re-usable components as QML Files
        - Add a Button for "submitting" the order and show a visual status that the order
          is busy being processed, and then completed. A Timer can be used to simulate this.
        - If using anchors to arrange your design becomes complex, try using
          RowLayout and ColumnLayout from the Qt Quick Layouts module.
    */
    width: 800
    height: 800
    visible: true
    title: qsTr("Ahji-Bhaji Restaurant")

    background: Image {
        source: "image/vietnamese_food.jpg"
        fillMode: Image.PreserveAspectCrop
        opacity: 0.3
    }

    FontLoader {
        id: themeFont
        source: "fonts/SpicyPotatos.ttf"
    }

    // Global font for all controls
    font.family: themeFont.name
    font.pixelSize: 20

    // Color palette for controls
    palette.text: "black"

    function updateOrder()
    {
        const menuList = [menuStarters, menuMains, menuBreads, menuSides]
        let totalAmount = OrderUtils.calcTotal(menuList)
        totalAmount += (diningOptionEatIn.checked) ? totalAmount * 0.05 : 0
        totalAmount += tipSlider.value
        console.log("Order has been updated; total amount: $", totalAmount)
        totalAmountLabel.text = `Total Order Cost: $${totalAmount}`
    }

    header: Label {
        text: window.title
        font.pixelSize: 28
        padding: 10
        horizontalAlignment: Text.AlignHCenter
        Layout.alignment: Qt.AlignHCenter
    }

    Pane {
        anchors.fill: parent
        background: Rectangle {
            color: "transparent"
        }
        padding: 20

        RowLayout {
            anchors.fill: parent
            spacing: 30

            //---- Left column ---
            ColumnLayout {
                spacing: 8

                MenuPage {
                    id: menuStarters
                    title: "Starters"
                    item1 {
                        name: qsTr("Onion Bhaji")
                        price: 10
                        onQuantityUpdated: updateOrder()
                    }
                    item2 {
                        name: qsTr("Meat Samosa")
                        price: 12
                        onQuantityUpdated: updateOrder()
                    }
                    item3 {
                        name: qsTr("Nargis Kebab")
                        price: 15
                        onQuantityUpdated: updateOrder()
                    }
                }
                MenuPage {
                    id: menuMains
                    title: "Mains"
                    item1 {
                        name: qsTr("Paneer Tikka")
                        price: 20
                        onQuantityUpdated: updateOrder()
                    }
                    item2 {
                        name: qsTr("Lamb Bhuna")
                        price: 25
                        onQuantityUpdated: updateOrder()
                    }
                    item3 {
                        name: qsTr("Murgh Tikka")
                        price: 28
                        onQuantityUpdated: updateOrder()
                    }
                }
                Page {
                    id: spiceLevel
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    header: Label {
                        text: qsTr("Spice Level")
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

                    RowLayout {
                        anchors.fill: parent
                        spacing: 0

                        Image {
                            source: "image/light/mild.svg"
                            fillMode: Image.PreserveAspectFit
                            Layout.fillWidth: true
                        }

                        Dial {
                            id: spiceLevelDial
                            startAngle: -140.0
                            endAngle: 140.0
                            from: 0.0
                            to: 100.0
                            stepSize: 10.0
                            scale: 1.5
                            Layout.fillWidth: true
                            onMoved: console.log("Spice Level updated:",
                                                 spiceLevelDial.value, "%")
                        }

                        Image {
                            source: "image/light/very_hot.svg"
                            fillMode: Image.PreserveAspectFit
                            Layout.fillWidth: true
                        }
                    }
                }
            }
            //---- Right column ---
            ColumnLayout {
                spacing: 8

                MenuPage {
                    id: menuSides
                    title: "Sides"
                    item1 {
                        name: qsTr("Pilau Rice")
                        price: 10
                        onQuantityUpdated: updateOrder()
                    }
                    item2 {
                        name: qsTr("Aloo Ghobi")
                        price: 12
                        onQuantityUpdated: updateOrder()
                    }
                    item3 {
                        name: qsTr("Ahji Bahji")
                        price: 15
                        onQuantityUpdated: updateOrder()
                    }
                }
                MenuPage {
                    id: menuBreads
                    title: "Breads"
                    item1 {
                        name: qsTr("Garlic Naan")
                        price: 15
                        onQuantityUpdated: updateOrder()
                    }
                    item2 {
                        name: qsTr("Keema Naan")
                        price: 18
                        onQuantityUpdated: updateOrder()
                    }
                    item3 {
                        name: qsTr("Naan at all")
                        price: 10
                        onQuantityUpdated: updateOrder()
                    }
                }
                Page {
                    id: diningOptions
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    padding: 10

                    header: Label {
                        text: qsTr("Dining Options")
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

                    ColumnLayout {
                        anchors.fill: parent
                        spacing: 5

                        RowLayout {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            RadioButton {
                                id: diningOptionEatIn
                                text: qsTr("Eat In (+5%)")
                                checked: true
                                onCheckedChanged: updateOrder()
                            }
                            RadioButton {
                                id: diningOptionTakeAway
                                text: qsTr("Take away")
                                onCheckedChanged: updateOrder()
                            }
                        }

                        Label {
                            text: qsTr("Tip Amount")
                            font.pixelSize: 28
                            // padding: 10
                            horizontalAlignment: Text.AlignLeft
                            Layout.alignment: Qt.AlignLeft
                        }

                        RowLayout {
                            // Customized slider to enhance the usability
                            Slider {
                                id: tipSlider
                                from: 0.0
                                to: 20.0
                                stepSize: 1
                                value: 0
                                Layout.fillWidth: true
                                snapMode: Slider.SnapOnRelease
                                height: 15

                                // Full groove
                                background: Rectangle {
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    height: 10
                                    radius: 5
                                    color: "#cccccc"
                                }

                                // Filled portion - progress color effect
                                Rectangle {
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.left: parent.left
                                    height: 10
                                    radius: 5
                                    color: "orange" // filled color
                                    width: tipSlider.visualPosition * tipSlider.width
                                }

                                // Customized handle
                                handle: Rectangle {
                                    width: 20
                                    height: 20
                                    radius: 20
                                    color: "black"

                                    // Bind the handle's x to the slider's position
                                    x: tipSlider.visualPosition * (tipSlider.width - width)
                                    y: (parent.height - height) / 2
                                }

                                onMoved:
                                {
                                    tipLabel.text = `$${tipSlider.value}`
                                    updateOrder()
                                }
                            }

                            Label {
                                id: tipLabel
                                text: "$0"
                                font.pixelSize: 22
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                                Layout.preferredWidth: 40 // RowLayout considers the label’s implicit width
                                Layout.minimumWidth: 40 // ensures the layout reserves space
                            }
                        }

                    }
                }
            }
        }
    }

    footer: ToolBar {
        height: 60
        RowLayout {
            anchors.fill: parent
            anchors.margins: 10
            spacing: 10
            Label {
                id: totalAmountLabel
                text: "Total Order Cost: $0"
                font.pixelSize: 28
            }
            Item {Layout.fillWidth: true }
            ToolButton {
                id: orderButton
                text: qsTr("Order Now")
                background: Rectangle {
                    anchors.fill: parent
                    implicitWidth: 120
                    color: orderButton.pressed ? "#9c9c9c" : "#c7c7c7"
                    radius: 5
                }
                // onClicked: Jsutil.updateOrder()
            }
        }
    }
}
