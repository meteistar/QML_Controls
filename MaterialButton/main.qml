import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Material Button")

    MaterialButton{
        width: 150
        height: 50
        anchors.centerIn: parent
        text: "Click Me!"
    }
}
