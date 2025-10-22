import QtQuick
import QtQuick.Controls.Basic


Page {

    header: Label {
        text: qsTr("Pickle Restaurant")
        font.family: themeFont.font.family
        font.pixelSize: 48
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        padding: 10
    }

    background: null
}
