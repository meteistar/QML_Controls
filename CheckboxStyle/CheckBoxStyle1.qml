import QtQuick 2.15
import QtQuick.Controls 2.15

CheckBox {
    id: control
    text: "CheckBox"
    checked: false

    property color indicatorColor: "#323232"
    property real indicatorRadius: control.height / 2
    property color indicatorImageColor: "#ffe400"
    property string indicatorImageSource: "qrc:/assets/checkmark_white.png"
    property bool fillBackground: true

    indicator: Rectangle{
        implicitHeight: control.height
        implicitWidth: control.height
        x: control.leftPadding
        y: control.height / 2 - height / 2
        radius: indicatorRadius
        border.color: indicatorColor
        color: fillBackground ? (control.checked ? indicatorColor : "white") : "white"

        ColoredImage{
            anchors.fill: parent
            anchors.margins: 4
            source: indicatorImageSource
            visible: control.checked
            color: indicatorImageColor

        }
    }

    contentItem: Text {
        text: control.text
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? "#646464" : "#323232"
        verticalAlignment: Text.AlignVCenter
        leftPadding: indicator.width + 20

    }
}
