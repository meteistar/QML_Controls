import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Popup BusyIndicator")

    PopupBusyIndicator{
        id: popupBusyIndicator
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
    }

    Button{
        text: "Load"
        anchors.centerIn: parent
        onClicked: {
            popupBusyIndicator.run();
        }
    }
}
