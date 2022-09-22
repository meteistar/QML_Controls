import QtQuick 2.15

ShadowRectangle {
    id: root
    width: 320
    height: 50
    radius: 8

    property alias iconSource: image.source
    property alias label: label.text
    property alias text: text.text

    property real iconSize: 25

    signal clicked()

    Row{
        anchors.fill: parent
        leftPadding: 15

        Image {
            id: image
            width: iconSize ; height: iconSize
            sourceSize: Qt.size(width, height)
            anchors.verticalCenter: parent.verticalCenter

        }

        Column{
            height: parent.height
            width: parent.width - 25
            leftPadding: 15

            Text {
                id: label
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 14
                color: "#323232"
                width: parent.width
                height: parent.height / 2
                elide: Text.ElideRight

            }

            Text{
                id: text
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 14
                font.bold: true
                color: "#323232"
                width: parent.width
                height: parent.height / 2
                elide: Text.ElideRight
                rightPadding: 10
                wrapMode: Text.Word
            }
        }

    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()

    }
}
