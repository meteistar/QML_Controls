import QtQuick 2.15

Row {
    leftPadding: 5

    property alias iconSource: image.source
    property alias label: label.text
    property alias text: text.text

    Image {
        id: image
        width: 25 ; height: 25
        sourceSize: Qt.size(width, height)
        anchors.verticalCenter: parent.verticalCenter
    }

    Column{
        height: parent.height
        width: parent.width - 25
        leftPadding: 5
        Text {
            id: label
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
            color: "#323232"
            width: parent.width
            elide: Text.ElideRight
        }

        Text {
            id: text
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 14
            font.bold: true
            width: parent.width
            elide: Text.ElideRight
            rightPadding: 10
        }
    }
}
