import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    id: control
    hoverEnabled: true
    focus: true
    font.pixelSize: 16

    property color outlineColor: "#ffe400"
    property color colorUp: "#ffe400"
    property color colorDown: Qt.lighter(colorUp, 1.75)
    property color colorHovered: colorDown
    property color backgroundColor: "white"
    property color backgroundHovered: backgroundColor

    property real radius: height/2
    property real outlineWidth: 2

    property bool isTransparent: true

    contentItem: Text {
        text: control.text
        font: control.font
        color: control.down ? colorDown : (control.hovered ? colorHovered : colorUp)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle{
        color: "transparent"

        Rectangle{
            anchors.fill: parent
            border.width: outlineWidth
            border.color: outlineColor
            radius: control.radius
            color: control.hovered ? backgroundHovered : (isTransparent ? "transparent" : backgroundColor)
        }
    }

}
