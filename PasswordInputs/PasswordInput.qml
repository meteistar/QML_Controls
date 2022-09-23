import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import AppUtil 1.0

Rectangle {
    id: root
    width: 320 ; height: 70
    radius: 6

    layer.enabled: true
    layer.effect: DropShadow{
        verticalOffset: 0
        horizontalOffset: 0
        samples: 17.0
        radius: 8.0
        color: "gray"
    }
}
