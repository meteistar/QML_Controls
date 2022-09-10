import QtQuick 2.0

Canvas {
    id: canvas
    width: 240
    height: 240
    antialiasing: true

    property real min: 0
    property real max: 100
    property real current: 0

    property color primaryColor: "orange"
    property color secondaryColor: "lightblue"
    property real primaryLineWidth: 3
    property real secondaryLineWidth: 6

    property real centerX: width / 2
    property real centerY: height / 2
    property real radius: (Math.min(width, height) - secondaryLineWidth)

    property real angle: (current / 100 * 2 * Math.PI)
    property real angleOffset: -Math.PI / 2

    property string text: "Text"

    onCurrentChanged: requestPaint()

    signal clicked()

    onPaint: {
        var ctx = getContext("2d");
        ctx.save();

        ctx.clearRect(0, 0, canvas.width, canvas.height);

        if(mouseArea.pressed){
            ctx.beginPath();
            ctx.lineWidth = 1;
            ctx.fillStyle = Qt.lighter("gray");
            ctx.arc(120, 120, 119, 0, 2*Math.PI);
            ctx.fill();
        }

        ctx.beginPath();
        ctx.lineWidth = 3;
        ctx.strokeStyle = secondaryColor;
        ctx.arc(120,120,117,0,2*Math.PI);
        ctx.stroke();

        ctx.beginPath();
        ctx.lineWidth = 5;
        ctx.strokeStyle = primaryColor;
        ctx.arc(120,120,117,-Math.PI/2 , -Math.PI/2 + angle);
        ctx.stroke();

        ctx.restore();
    }

    Text{
        anchors.centerIn: parent
        text: Math.round(canvas.current) + "%"
        color: canvas.secondaryColor
        font.bold: true
        font.pixelSize: 18
    }

    MouseArea{
        id: mouseArea

        anchors.fill: parent
        onClicked: canvas.clicked()
        onPressedChanged: canvas.requestPaint()
    }

}
