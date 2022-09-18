import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import SVG 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SVG")

    ImageConfirmDialog{
        id: imageConfirmDialog
    }

    Button{
        text: "Open"
        onClicked: {
            imageConfirmDialog.run("Do you want to proceed?", SVG.messageSent,callMe);
        }
    }

    function callMe(){
        console.log("--callback function is called");
    }
}
