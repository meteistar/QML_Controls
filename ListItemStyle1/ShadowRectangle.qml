import QtQuick 2.15
import QtGraphicalEffects 1.15

Rectangle{
    width: 100
    height: 100
    layer.enabled: true
    layer.effect: DropShadow{
        verticalOffset: 3
        horizontalOffset: 3
        samples: 17
        radius: 8.0
        color: "#80000000"
    }
}
