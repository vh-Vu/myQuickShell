import QtQuick
import QtQuick.Controls
import QtQuick.Effects

import "../widget"
import "../services"
Item{
    WeatherAnhCalendarWidget{
        id: calendarPopUp
    }

    Text {
        anchors.centerIn: parent
        text: Time.time
        color: "#f0f0f0"
        font.pointSize: 16
        font.family: "FiraCode Nerd Font"
        font.weight: Font.DemiBold
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                calendarPopUp.open();
            }
        }

        MultiEffect{
            source: calendarPopUp
            anchors.fill: calendarPopUp
            brightness: 0.4
            saturation: 0.2
            blurEnabled: true
            blurMax: 64
            blur: 1.0
        }
    }

}



