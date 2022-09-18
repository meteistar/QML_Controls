import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Ghost Button")

    GhostButton{
        anchors.centerIn: parent
        text: "Hello World!"
        width: 150
        height: 30
        backgroundColor: "#ffe400"
        colorHovered: "white"
    }
}
