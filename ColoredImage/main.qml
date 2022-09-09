import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Colored Image")

    Row{
        id: row
        anchors.centerIn: parent
        spacing: 20

        Image {
            id: originalImage
            source: "qrc:/assets/bank_grey.png"
            width: 40
            height: 40
        }
        ColoredImage{
            id: yellowBank
            width: 40
            height: 40
        }
        ColoredImage{
            id: blueBank
            width: 40
            height: 40
            color: "blue"
        }
    }


}
