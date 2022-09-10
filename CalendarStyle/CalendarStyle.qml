import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4 as Controls
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: 200
    height: 200
    radius: 6

    layer.enabled: true
    layer.effect: DropShadow{
        verticalOffset: 0
        horizontalOffset: 0
        samples: 17
        radius: 8.0
        color: "#80000000"
    }

    property alias calendar: calendar
    property string dateFormat: "yyyy-MM-dd"
    property string currentDate: Qt.formatDate(new Date(), dateFormat)

    property alias selectedDate: calendar.selectedDate
    property var selectedFormattedDate: Qt.formatDate(selectedDate, dateFormat)

    signal dateClicked(var date)
    signal dateClickedFormatted(string dateString)

    Component.onCompleted: {
        setNavigationDateText()
    }

    Column{
        anchors.fill: parent
        anchors.margins: parent.radius
        clip: true

        Rectangle{
            id: navigationBar
            width: parent.width
            height: 50
            clip: true
            //previous year
            Rectangle{
                id: previousYear
                width: 30
                height: parent.height
                anchors.left: parent.left
                color: parent.color

                Image {
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/assests/double_left_grey.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        calendar.showPreviousYear();
                        setNavigationDateText();
                    }
                }
            }
            //previous month
            Rectangle{
                id: previousMonth
                width: 30
                height: parent.height
                anchors.left: previousYear.right
                color: parent.color

                Image {
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/assests/left_grey.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        calendar.showPreviousMonth();
                        setNavigationDateText();
                    }
                }
            }
            //navigation bar text
            Text {
                id: navigationDateText
                anchors.left: previousMonth.right
                anchors.right: nextMonth.left
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 16
                color: "#323232"
            }
            // end of navigation

            // next month
            Rectangle{
                id: nextMonth
                width: 30
                height: parent.height
                anchors.right: nextYear.left
                color: parent.color

                Image {
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/assests/right_grey.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        calendar.showNextMonth();
                        setNavigationDateText();
                    }
                }
            }
            // next year
            Rectangle{
                id: nextYear
                width: 30
                height: parent.height
                anchors.right: parent.right
                color: parent.color

                Image {
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/assests/double_right_grey.png"
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        calendar.showNextYear();
                        setNavigationDateText();
                    }
                }
            }
            // end of column
        }
        Controls.Calendar{
            id: calendar
            width: parent.width
            height: parent.height - navigationBar.height
            clip: true
            navigationBarVisible: false
            frameVisible: false

            onClicked: {
                selectedDate = date;
                selectedFormattedDate = Qt.formatDate(date, dateFormat);

                dateClicked(date);
                dateClickedFormatted(selectedFormattedDate);

                setNavigationDateText();
            }
            style: CalendarStyle{
                gridVisible: false

                dayDelegate: Rectangle{
                    Rectangle{
                        anchors.centerIn: parent
                        width: parent.width > parent.height ? parent.height : parent.width
                        height: width
                        color: currentDate === Qt.formatDate(styleData.date, dateFormat) ? "#ffe400" : "white"
                        radius: height / 2
                        border.width: styleData.selected ? 2 : 0
                        border.color: styleData.selected ? "#ffe400" : "white"

                        Label{
                            text: styleData.date.getDate()
                            anchors.centerIn: parent
                            font.pixelSize: 12
                            color: currentDate === Qt.formatDate(styleData.date, dateFormat) ? "white" : (!styleData.visibleMonth ? "grey" : "#323232")
                        }
                    }
                }

                dayOfWeekDelegate: Rectangle{
                    width: calendar.width/7
                    height: 20
                    Label{
                        text: getDayOfTheWeek(styleData.dayOfWeek)
                        font.pixelSize: 12

                    }
                }
            }
        }
    }

    function setNavigationDateText(){
        var year = getYear();
        var month = getMonth();
        navigationDateText.text = month + " " + year;
    }

    function getDayOfTheWeek(index){
        var dayString;

        switch(index){
        case 0:
            dayString = "Sun"
            break;
        case 1:
            dayString = "Mon"
            break;
        case 2:
            dayString = "Tue"
            break;
        case 3:
            dayString = "Wed"
            break;
        case 4:
            dayString = "Thu"
            break;
        case 5:
            dayString = "Fri"
            break;
        case 6:
            dayString = "Sat"
            break;
        }

        return dayString;
    }

    function getMonth(){
        switch(calendar.visibleMonth){
        case 0:
            return "January";
        case 1:
            return "February";
        case 2:
            return "March";
        case 3:
            return "April";
        case 4:
            return "May";
        case 5:
            return "June";
        case 6:
            return "July";
        case 7:
            return "August";
        case 8:
            return "September";
        case 9:
            return "October";
        case 10:
            return "November";
        case 11:
            return "December";
        default:
            break;
        }
    }

    function getYear(){
        return calendar.visibleYear;
    }


}
