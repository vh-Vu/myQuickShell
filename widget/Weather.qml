import QtQuick
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes

Rectangle{
    id:root
    property double realFeel : 28.4;
    property string state: "Clear"
    property string nextState: "Clear"
    property int humidity: 	69;
    height: 370
    width: 280
    radius: 10
    color: "transparent" 
    anchors.verticalCenter: parent.verticalCenter
    
    Rectangle {
        anchors.fill: parent
        radius: 10
        color: "transparent"
        gradient: LinearGradient {
            x1: 0
            y1: 0
            x2: 280
            y2: 0
            GradientStop { position: 0.0; color: '#1AFFFFFF' }
            GradientStop { position: 1.0; color: '#0AFFFFFF' } 
        }
    }
    Column {
        x:40
        y:20

        spacing: 5
        Text {
            anchors.centerIn: root
            text: root.state
            color: "#f0f0f0"
            font.pointSize: 20
            font.family: "Solway"
            font.weight: Font.Bold


        }
        

        Image {
            width: 120; height: 120
        fillMode: Image.PreserveAspectFit
        source: "../asset/Cloud.png"
        }

        Row {

            
            Text {
                text: `${realFeel}°C`
                color: "#FFFFFF"
                font.pointSize: 20
                font.family: "Solway"
                font.weight: Font.Bold
            }
        }

        Row {
            spacing: 5
            Text {

                text: "Humidity:"
                color: "#CCCCCC"
                font.pointSize: 14
                font.family: "Solway"
                font.weight: Font.Normal

            }
            Text {
                text: `${humidity}%`
                color: "#FFFFFF"
                font.pointSize: 14
                font.family: "Solway"
                font.weight: Font.Bold
            }
        }

        Row {
            spacing: 5
            Text {
                text: "Next hour:"
                color: "#CCCCCC"
                font.pointSize: 14
                font.family: "Solway"
                font.weight: Font.Normal
            }
            Text {
                text: `${nextState}`
                color: "#99CCFF"
                font.pointSize: 14
                font.family: "Solway"
                font.weight: Font.Bold
            }
        }
    }
}
