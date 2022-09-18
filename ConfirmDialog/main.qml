import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Confirm Dialog")

    ConfirmDialog{
        id: confirmDialog
    }

    Button{
        text: "Open Popup"
        onClicked: {
            confirmDialog.run("Do you want to proceed?", callMe);
        }
    }

    function callMe(){
        console.log("--callback function is called");
    }
}
