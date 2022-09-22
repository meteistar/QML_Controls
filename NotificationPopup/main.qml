import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Notification Popup")

    NotificationPopup{
        id: notificationPopup
        anchors.centerIn: parent

    }

    Button{
        text: "Notify"
        onClicked: {
            notificationPopup.open("Message sent!", "qrc:/assets/reading_confirmation_pastel.png");
        }
    }
}
