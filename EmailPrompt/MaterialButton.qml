import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: control
    width: 130
    height: 50

    property color backgroundColor: "#f0f0f0"
    property color animatedBackgroundColor: "blue"//Qt.rgba(1,1,1,0.9)
    property color colorUp: "black"
    property color colorDown: colorUp
    property color shadowColorUp: rgb(100, 100, 100, 0.5)
    property color shadowColorDown: rgb(100, 100, 100, 0.8)

    property bool shadowEnabled: true
    property real btnRadius: 6

    contentItem: Text{
        text: control.text
        font: control.font
        color: control.down ? colorDown : colorUp
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle{
        anchors.fill: parent
        radius: control.btnRadius
        color: control.backgroundColor
        layer.enabled: shadowEnabled ? true : false
        layer.effect: DropShadow{
            verticalOffset: 0
            horizontalOffset: 0
            samples: 17
            radius: 8.0
            color: control.down ? shadowColorDown : shadowColorUp

        }

        Rectangle{
            id: animatedRectangle
            anchors.centerIn: parent
            color: animatedBackgroundColor
            scale: 0
            width: parent.width > parent.height ? parent.width : parent.height
            height: width
            radius: width/2

            ParallelAnimation{
                id: btnBackgroundAnim

                NumberAnimation{
                    target: animatedRectangle
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 300

                }
                NumberAnimation{
                    target: animatedRectangle
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 300
                }
                onStopped: {
                    animatedRectangle.scale = 0;
                    animatedRectangle.opacity = 1;
                }

            }

        }
    }

    onClicked: {
        btnBackgroundAnim.start();
    }

    function rgb(red,green,blue, alpha){
        return Qt.rgba(red/255, green/255, blue/255, alpha)
    }
}
