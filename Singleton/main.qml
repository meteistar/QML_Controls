import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import AppUtil 1.0
import SVG 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Singleton")

    Column{
        anchors.centerIn: parent
        spacing: 20
        Label{
            text: "Hello World"
            font.pixelSize: 30
        }
        Label{
            text: "Hello World"
            font.family: AppUtil.font1.name
            font.pixelSize: 30
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            console.log("Clicked ... : ", AppUtil.deneme);
            console.log("Clicked : ", SVG.deneme);
        }
    }
}
