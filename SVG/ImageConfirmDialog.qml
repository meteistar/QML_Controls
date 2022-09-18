import QtQuick 2.15
import QtQuick.Controls 2.15

Popup {
    id: root
    width: 320
    height: 300
    modal: true
    closePolicy: Popup.CloseOnEscape
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    background: Rectangle{
        radius: 8
    }

    property var callback
    property bool isCallbackSet: false

    property string source
    property string text: ""

    function run(messageText, imageSource, callable){

        if(callable !== null){
            callback = callable;
            isCallbackSet = true;
        }else{
            isCallbackSet = false;
        }
        source = imageSource;
        text = messageText;
        root.open();
    }

    Rectangle{
        anchors.fill: parent

        Column{
            anchors.fill: parent
            spacing: 10

            Image{
                source: root.source
                width: parent.width
                height: 150
                fillMode: Image.PreserveAspectFit
                sourceSize.width: width
            }

            Text {
                text: root.text
                width: parent.width
                height: 50
                font.pixelSize: 15
                color: "#323232"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                elide: Text.ElideRight
                wrapMode: Text.Wrap
                clip: true
            }

            Row{
                width: parent.width
                height: childrenRect.height
                spacing: 20
                layoutDirection: Qt.RightToLeft
                Button{
                    text: "OK"
                    width: 90
                    height: 40
                    font.pixelSize: 15
                    onClicked: {
                        root.close();
                        if(isCallbackSet){
                            callback();
                        }
                    }
                }
                Button{
                    text: "Cancel"
                    width: 130
                    height: 40
                    onClicked: {
                        root.close();
                    }
                }
            }
        }
    }
}
