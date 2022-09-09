import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Colored Image")

    RowLayout{
        id: row
        anchors.centerIn: parent
        spacing: 20

        ColumnLayout{
            spacing: 10

            Item{
                id: orgContainer
                width: 100
                height: 100
                Layout.alignment: Qt.AlignHCenter

                Rectangle{
                    id: frame1
                    anchors.fill: parent
                    border.color: "black"
                }
                DropShadow{
                    anchors.fill: frame1
                    horizontalOffset: 3
                    verticalOffset: 3
                    radius: 8.0
                    samples: 17
                    color: "#80000000"
                    source: frame1
                }

                Image {
                    id: originalImage
                    anchors.centerIn: parent
                    source: "qrc:/assets/bank_grey.png"

                }
            }
            Label{
                text: "Org Img"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter

            }
        }

        ColumnLayout{
            spacing: 10

            Item{
                width: 100
                height: 100
                Layout.alignment: Qt.AlignHCenter

                Rectangle{
                    id: yellowBankFrame
                    anchors.fill: parent
                    border.color: "black"
                }

                DropShadow{
                    anchors.fill: yellowBankFrame
                    horizontalOffset: 3
                    verticalOffset: 3
                    radius: 8.0
                    samples: 17
                    color: "#80000000"
                    source: yellowBankFrame
                }

                ColoredImage{
                    id: yellowBank
                    anchors.centerIn: parent
                    width: 40
                    height: 40
                }
            }

            Label{
                text: "Yellow Img"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter

            }
        }

        ColumnLayout{
            Item{
                width: 100
                height: 100
                Layout.alignment: Qt.AlignCenter

                Rectangle{
                    id: blueBankFrame
                    anchors.fill: parent
                    border.color: "black"
                }

                DropShadow{
                    anchors.fill: blueBankFrame
                    source: blueBankFrame
                    horizontalOffset: 3
                    verticalOffset: 3
                    radius: 8.0
                    samples: 17
                    color: "#80000000"

                }

                ColoredImage{
                    id: blueBank
                    anchors.centerIn: parent
                    width: 40
                    height: 40
                    color: "blue"
                }
            }

            Label{
                text: "Blue Img"
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }


}
