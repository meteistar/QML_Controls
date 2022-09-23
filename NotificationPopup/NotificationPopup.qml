import QtQuick 2.15
import QtQuick.Controls 2.15

ShadowedRectangle {
    id: root
    visible: false
    width: childrenRect.width
    height: 40
    radius: height / 2

    property string text
    property string source

    property alias iconEnabled: notificationIcon.visible

    function open(notificationText, imageSource){
        opacityAnimation.stop();
        root.opacity = 0
        root.visible = true;

        text = notificationText;
        source = imageSource;

        timer.start();
    }
    Timer{
        id: timer
        interval: 1000
        onTriggered: {
            opacityAnimation.start();
        }

    }

    Row{
        width: childrenRect.width
        height: parent.height
        leftPadding: 10
        spacing: 10
        Image {
            id: notificationIcon
            source: root.source
            width: visible ? 25 : 0
            height: width
            sourceSize: Qt.size(width, height)
            anchors.verticalCenter: parent.verticalCenter
        }
        Text {
            text: root.text
            height: parent.height
            width: contentWidth + 20
            color: "#323232"
            font.pixelSize: 14
            verticalAlignment: Text.AlignVCenter
        }
    }

    SequentialAnimation{
        id: opacityAnimation
        ParallelAnimation{
        NumberAnimation{
            target: root
            property: "opacity"
            to: 1
            duration: 1000
        }
        NumberAnimation{
            target: root
            property: "y"
            from: 300
            to:250
            duration: 1000
        }
    }
    NumberAnimation{
        //id: opacityAnimation
        target: root
        property: "opacity"
        to: 0
        duration: 2000
        onStopped: {
            root.visible = false;
        }

    }

    }
}
