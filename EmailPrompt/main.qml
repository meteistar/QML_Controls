import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Email prompt")

    Rectangle{
        anchors.fill: parent

        EmailPrompt{
            id: emailpromt
        }

        Button{
            anchors.centerIn: parent
            width: 150 ; height: 40
            text: "Get email"
            onClicked: {
                emailpromt.run(print_)
            }
        }
    }

    function print_(email){
        console.log("Email: " + email)
    }
}
