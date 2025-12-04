import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes
import QtQuick.Controls
import QtQuick.Layouts

// cpu use, temp, memory, power consum, 
Rectangle{
    id:root
    height: 370
    width: 480
    radius: 10
    color: "transparent" 
    property date today: new Date()
    property var daysOfWeek: ["Sunday","Monday","Tuesday","Wednesday", "Thusday", "Friday","Saturday"]
    property var shortDaysOfWeek: ["SUN","MON","TUE","WED", "THU", "FRI","SAT"]
    property var monthsShortName:["Jan", "Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]
    property string dayOfWeek: daysOfWeek[today.getDay()]

    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "transparent"
        // Áp dụng gradient nhẹ lên trên cùng
        gradient: LinearGradient {
            x1: 0
            y1: 0
            x2: 280
            y2: 0

            GradientStop { position: 0.0; color: '#1AFFFFFF' }
            GradientStop { position: 1.0; color: '#0AFFFFFF' } 
        }
    }

    Column{
        id: col 
        anchors.centerIn: parent
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            Text{
                anchors.horizontalCenter: parent
                text: `${dayOfWeek}, ${control.currentDay} ${monthsShortName[grid.month]} ${grid.year}`;
                font.pointSize: 20
                font.family: control.font
                font.weight: Font.Bold
                color: "#FFFFFF"
            }
        }
        spacing: 30
        GridLayout {
            id: control
            columns: 1
            property string font: "Solway"
            property string color: "#FFFFFF"
            property int currentDay: root.today.getDate();
            DayOfWeekRow {
                locale: grid.locale

                Layout.minimumWidth: 400
                Layout.fillWidth: true

                delegate: Text {
                    text: shortDaysOfWeek[model.day] 
                    font.family: control.font
                    font.pointSize: 14
                    font.weight: Font.Bold
                    color: control.color
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    required property var model
                }   
            }

            rowSpacing: 15


            MonthGrid {
                id: grid
                month: model.month
                year: model.year
                locale: Qt.locale("vn_VN")
                Layout.fillWidth: true
                Layout.fillHeight: true

                property int days: 28
                delegate: Text {
                    font.family: control.font
                    font.pointSize: 14
                    font.weight: isToday? Font.Bold : Normal
                    color: isToday? '#6eb4fa' : control.color 
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    opacity: model.month === grid.month ? 1 : 0.3
                    text: model.day
                    required property var model
                    readonly property bool isToday: model.day === control.currentDay && model.month == grid.month && model.year == grid.year
                }
            }
            
        }
        //
    }

}