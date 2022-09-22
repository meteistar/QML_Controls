import QtQuick 2.15
import QtGraphicalEffects 1.15

Rectangle {
    id: root

    property real verticalOffset: 3.0
    property real horizontalOffset: 3.0
    property color color: "#80000000"

    radius: 8
    layer.enabled: true
    layer.effect: DropShadow{
        verticalOffset: root.verticalOffset
        horizontalOffset: root.horizontalOffset
        color: root.color
        radius: 8.0
        samples: 17.0
    }
}
