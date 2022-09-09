import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Checkbox Style")

    CheckBoxStyle1{
        anchors.centerIn: parent
        width: 150
        height: 30
        text: "Hello World!"
    }
}