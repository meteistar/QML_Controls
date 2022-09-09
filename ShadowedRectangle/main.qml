import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Shadowed Rectangle")

    Column{
        anchors.centerIn: parent
        spacing: 20

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
        Item{
            width: rect2.width
            height: rect2.height

            Rectangle{
                id: rect2
                width: 100
                height: 100
                //border.color: "black"
            }
            DropShadow{
                anchors.fill: rect2
                source: rect2
                verticalOffset: 3
                horizontalOffset: 3
                samples: 17
                radius: 8.0
                color: "#80000000"
            }
        }



    }


}
