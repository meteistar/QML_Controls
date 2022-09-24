import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: root
    width: 320 ; height: 190
    modal: true
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    background: Rectangle{
        radius: 8
    }

    property var callback

    Rectangle{
        anchors.fill: parent

        Column{
            anchors.fill: parent
            spacing: 15

            Text {
                text: qsTr("Hey, we kindly need your email!")
                width: parent.width
                height: 40
                color: "#323232"
                verticalAlignment: Text.AlignVCenter
                leftPadding: 10
                font.pixelSize: 18
                font.bold: true

            }

            TextFieldStyle1{
                id: emailEdit
                width: 300 ; height: 60
                anchors.horizontalCenter: parent.horizontalCenter
                icon.source: "qrc:/assets/email_grey.png"
                lineEdit.placeholderText: "Email"
            }

            Row{
                width: parent.width
                height: 40
                spacing: 10
                rightPadding: 5
                layoutDirection: Qt.RightToLeft

                MaterialButton{
                    width: 100 ; height: parent.height
                    text: "Submit"
                    font.pixelSize: 16
                    colorUp: "white"
                    backgroundColor: "#323232"

                    onClicked: {
                        if(!emailEdit.textValid){
                            emailEdit.textValidityIndicator.visible = true;
                        }

                        root.close();
                        callback(emailEdit.text)
                    }
                }

                MaterialButton{
                    width: 100 ; height: parent.height
                    text: "Close"
                    font.pixelSize: 16
                    colorUp: "#323232"
                    backgroundColor: "white"

                    onClicked: {

                        root.close();
                    }
                }
            }
        }

    }


    function run(callable){
        root.open();
        callback = callable;

    }


}
