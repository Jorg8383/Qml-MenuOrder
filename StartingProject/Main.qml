import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

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
    font.pixelSize: 16

    // Color palette for controls
    palette.text: "black"


    Pane {
        anchors.fill: parent
        background: Rectangle {color: "transparent"}
        padding: 20

        RowLayout {
            anchors.fill: parent
            spacing: 30

            //---- Left column ---
            ColumnLayout {
                spacing: 8

                MenuPage {
                    title: "Starters"
                    item1 {
                        name: qsTr("Onion Bhaji")
                        price: 10
                    }
                    item2 {
                        name: qsTr("Meat Samosa")
                        price: 12
                    }
                    item3 {
                        name: qsTr("Nargis Kebab")
                        price: 15
                    }
                }
                MenuPage {
                    title: "Mains"
                    item1 {
                        name: qsTr("Paneer Tikka")
                        price: 20
                    }
                    item2 {
                        name: qsTr("Lamb Bhuna")
                        price: 25
                    }
                    item3 {
                        name: qsTr("Murgh Tikka")
                        price: 28
                    }
                }
            }
            //---- Right column ---
            ColumnLayout {
                spacing: 8

                MenuPage {
                    title: "Sides"
                    item1 {
                        name: qsTr("Pilau Rice")
                        price: 10
                    }
                    item2 {
                        name: qsTr("Aloo Ghobi")
                        price: 12
                    }
                    item3 {
                        name: qsTr("Ahji Bahji")
                        price: 15
                    }
                }
                MenuPage {
                    title: "Breads"
                    item1 {
                        name: qsTr("Garlic Naan")
                        price: 15
                    }
                    item2 {
                        name: qsTr("Keema Naan")
                        price: 18
                    }
                    item3 {
                        name: qsTr("Naan at all")
                        price: 10
                    }
                }
            }
        }
    }
}

    // Pane {
    //     anchors.fill: parent
    //     background: Rectangle {color: "transparent"}

    //     RowLayout {
    //         anchors.fill: parent
    //         spacing: 10

    //         //---- Left column ---
    //         ColumnLayout {
    //             Layout.fillWidth: true
    //             Layout.fillHeight: true
    //             spacing: 8

    //             MenuPage {
    //                 id: starters
    //                 title: qsTr("Starters")

    //                 Layout.fillWidth: true

    //                 DishItem {
    //                     name: qsTr("Onion Bhaji")
    //                     price: 10
    //                 }
    //                 DishItem {
    //                     name: qsTr("Meat Samosa")
    //                     price: 12
    //                 }
    //                 DishItem {
    //                     name: qsTr("Nargis Kebab")
    //                     price: 15
    //                 }
    //             }
    //             MenuPage {
    //                 id: mains
    //                 title: qsTr("Mains")

    //                 Layout.fillWidth: true

    //                 DishItem {
    //                     name: qsTr("Paneer Tikka")
    //                     price: 20
    //                 }
    //                 DishItem {
    //                     name: qsTr("Lamb Bhuna")
    //                     price: 25
    //                 }
    //                 DishItem {
    //                     name: qsTr("Murgh Tikka")
    //                     price: 28
    //                 }
    //             }
    //         }
    //         //---- Right column ---
    //         ColumnLayout {
    //             Layout.fillWidth: true
    //             Layout.fillHeight: true
    //             spacing: 8

    //             MenuPage {
    //                 id: sides
    //                 title: qsTr("Sides")

    //                 Layout.fillWidth: true

    //                 DishItem {
    //                     name: qsTr("Pilau Rice")
    //                     price: 10
    //                 }
    //                 DishItem {
    //                     name: qsTr("Aloo Ghobi")
    //                     price: 12
    //                 }
    //                 DishItem {
    //                     name: qsTr("Ahji Bahji")
    //                     price: 15
    //                 }
    //             }
    //             MenuPage {
    //                 id: breads
    //                 title: qsTr("Breads")

    //                 Layout.fillWidth: true

    //                 DishItem {
    //                     name: qsTr("Garlic Naan")
    //                     price: 15
    //                 }
    //                 DishItem {
    //                     name: qsTr("Keema Naan")
    //                     price: 18
    //                 }
    //                 DishItem {
    //                     name: qsTr("Naan at all")
    //                     price: 1
    //                 }
    //             }
    //         }
    //     }
    // }
// }
