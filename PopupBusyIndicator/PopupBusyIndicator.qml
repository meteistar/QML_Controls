import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: root
    width: 180
    height: 60
    clip: true
    modal: true
    padding: 2
    closePolicy: Popup.NoAutoClose

    signal timeout()

    onTimeout: close()

    background: Rectangle{
        radius: 6
    }

    function run(){
        control.running = true;
        timeoutTimer.start();
        root.open();
    }

    Rectangle{
        anchors.fill: parent

        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            width: childrenRect.width
            height: parent.height
            spacing: 10

            BusyIndicator{
               id: control
               running: false
               anchors.verticalCenter: parent.verticalCenter

            }

            Text{
                id: indicatorText
                text: "Loading..."
                height: parent.height
                width: contentWidth + 10
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

        }
    }

    Timer{
        id: timeoutTimer
        interval: 20000
        onTriggered: {
            timeout()
            control.running = false;
        }
    }

}
