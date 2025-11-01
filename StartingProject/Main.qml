import QtQuick
import QtQuick.Controls.Fusion
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
                                checked: true
                                text: qsTr("Eat In")
                            }
                            RadioButton {
                                id: diningOptionTakeAway
                                text: qsTr("Take away")
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
                            Slider {
                                id: tipSlider
                                from: 0.0
                                to: 20.0
                                stepSize: 1
                                value: 0
                                Layout.fillWidth: true
                                snapMode: Slider.SnapOnRelease
                                onMoved: tipLabel.text = `$${tipSlider.value}`
                            }

                            Label {
                                id: tipLabel
                                text: "$0"
                                font.pixelSize: 22
                                // horizontalAlignment: Text.AlignRight
                                // Layout.alignment: Qt.AlignRight
                            }
                        }

                    }
                }
            }
        }
    }
}
