import QtQuick 2.12

Item {
    id: root

    property real size: 50
    property int indicatorCount: 7
    property real indicatorSize: 8
    property color indicatorColor: "#ffe400"
    property bool running: true
    property int durationTime: 1500
    property int delayTime: durationTime / 12

    width: size ; height: size
    visible: running

   Repeater{
       model: indicatorCount

        Rectangle{
            id: hand
            width: parent.width / 2
            height: 10
            x: parent.width / 2
            y: parent.height / 2 - height / 2
            transformOrigin: Item.Left
            rotation: -90

            Rectangle{
                id: indicator
                width: indicatorSize ; height: indicatorSize
                anchors.right: parent.right
                color: indicatorColor
                radius: width / 2
                anchors.verticalCenter: parent.verticalCenter
            }

            Timer{
                running: root.running
                interval: (indicatorCount * delayTime) + durationTime
                onTriggered: sequentialAnimation.start();
                repeat: true
                triggeredOnStart: true
            }

            SequentialAnimation{
                id: sequentialAnimation


                PauseAnimation {
                    duration: index * delayTime
                }

                NumberAnimation{
                    target: hand
                    property: "rotation"
                    duration: durationTime
                    easing: Easing.InOutQuad
                    from: -90
                    to: 270

                }
            }
        }
    }

    //end of root
}
