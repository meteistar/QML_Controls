import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Circular Progress Bar")

    CircularProgressBar{
        id: bar
        anchors.centerIn: parent
        current: 25

        NumberAnimation{
            target: bar
            properties: "current"
            from:0
            to: 100
            duration: 4000
            loops: Animation.Infinite
            running: true
            easing.type: Easing.InCurve

        }
    }
}
