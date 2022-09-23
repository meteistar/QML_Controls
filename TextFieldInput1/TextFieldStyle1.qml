import QtQuick 2.15
import QtQuick.Controls 2.15
import AppUtil 1.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: 320
    height: 70
    radius: 6

    layer.enabled: true
    layer.effect: DropShadow{
        verticalOffset: 0
        horizontalOffset: 0
        samples: 17.0
        radius: 8.0
        color: control.focus ? Qt.rgba(255/255, 228/255, 0/255, 1) : Qt.rgba(100/255, 100/255, 100/255, 0.3)
    }

    property alias icon: lineEditIcon
    property alias lineEdit: control

    property alias text: control.text
    property string regex: ""

    property bool textValid: false
    property alias textValidityIndicator: validityIndicatorCnt
    property bool validityIndicatorEnabled: true

    function validateString(text){
        if(regex === ""){
            root.textValid = true;
            return;
        }

        var patt = new RegExp(root.regex);
        var result = patt.test(text);
        root.textValid = result;

    }

    function hideTextValidatorIndicator(){
        root.textValidityIndicator.visible = false;
    }

    function reset(){
        root.lineEdit.clear();
        hideTextValidatorIndicator();
    }

    Column{
        anchors.fill: parent
        anchors.margins: 2

        Rectangle{
            id: labelContainer
            width: parent.width
            height: visible ? 20 : 0
            clip: true
            visible: lineEdit.text !== ""

            Text {
                id: labelText
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                text: lineEdit.placeholderText
                leftPadding: iconContainer.width + lineEdit.leftPadding
                font.family: AppUtil.font1.name
                font.pixelSize: 14
                color: "#323232"

            }
        }

        Row{
            width: parent.width
            height: parent.height - labelContainer.height
            Rectangle{
                id: iconContainer
                width: parent.height
                height: parent.height

                Image {
                    id: lineEditIcon
                    width: 30 ; height: 30
                    anchors.centerIn: parent
                }
            }
            TextField{
                id: control
                width: parent.width - iconContainer.width - validityIndicatorCnt.width
                height: parent.height
                font.family: AppUtil.font1.name
                font.pixelSize: 16
                leftPadding: 15
                clip: true
                selectionColor: "#fddd5c"
                selectedTextColor: "#353637"
                verticalAlignment: "AlignVCenter"

                background: Rectangle{
                    border.width: 0
                    clip: true

                }

                onTextChanged: {
                    validateString(control.text);
                    if(!validityIndicatorCnt.visible && validityIndicatorEnabled && control.enabled){
                        validityIndicatorCnt.visible = true;
                    }
                }

            }

            Rectangle{
                id: validityIndicatorCnt
                visible: false
                width: visible ? validityIndicator.width + 10 : 0
                height: parent.height

                Image {
                    id: validityIndicator
                    width: 25 ; height: 25
                    anchors.centerIn: parent
                    source: textValid ? "qrc:/assets/checkmark_grey.png" : "qrc:/assets/error_grey.png"
                }
            }
        }
    }

}
