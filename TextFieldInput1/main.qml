import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Text Field Style")

    Rectangle{
        anchors.fill: parent

        TextFieldStyle1{
            anchors.centerIn: parent
            lineEdit.placeholderText: "Email"
            icon.source: "qrc:/assets/email_grey.png"
            regex: "^([\\w]+\\.?)+@([\\w]+\\.)+([\\w]+\\/?)+\\w$"
        }
    }
}
