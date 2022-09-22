import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("List Item Style")

    ListModel{
        id: fruitModel
        ListElement{
            fruitName: "Strawberry"
            fruitIcon: "qrc:/assets/strawberry_pastel.png"
            price: "$3"
        }
        ListElement{
            fruitName: "Avocado"
            fruitIcon: "qrc:/assets/avocado_pastel.png"
            price: "$5"
        }
        ListElement{
            fruitName: "Tomato"
            fruitIcon: "qrc:/assets/tomato_pastel.png"
            price: "$4"
        }
        ListElement{
            fruitName: "Watermelon"
            fruitIcon: "qrc:/assets/watermelon_pastel.png"
            price: "$10"
        }

    }

    Column{
        anchors.centerIn: parent
        width: parent.width
        height: childrenRect.height
        spacing: 10

        Repeater{
            model: fruitModel
            ListItemStyle1{
                width: 150
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                label: fruitName
                iconSource: fruitIcon
                text: "Price: " + price
            }
        }
    }
}
