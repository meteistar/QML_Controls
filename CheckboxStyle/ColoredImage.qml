import QtQuick 2.0
import QtGraphicalEffects 1.15

Item {
    id: root

    property alias img: image
    property alias source: image.source
    property alias color: overlay.color

    Image {
        id: image
        anchors.fill: parent
        source: "qrc:/assets/bank_grey.png"
        smooth: true
    }

    ColorOverlay{
        id: overlay
        anchors.fill: image
        source: image
        color: "#FFE400"
    }
}
