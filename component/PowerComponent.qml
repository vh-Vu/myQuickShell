import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls


// Prototype only
Rectangle{
    id:root
    property int reminding: 400
    readonly property int batteryWidth: 60;
    readonly property int batteryHeight: 20
    readonly property int padding: 4

    color: 'transparent'
    width: batteryWidth
    height: batteryHeight
    
    // border.width : 3
    // radius: 7
    
    Rectangle{
        id: background
        color: '#919191'
        border.color: "transparent"
        width: batteryWidth-20
        height: batteryHeight
        radius: 7
        //anchors.centerIn: parent
        anchors {
            verticalCenter: parent.verticalCenter

        }
    }
    Rectangle{
        id: cover
        color: "#a6000000"
        width: 10
        height: batteryHeight
        radius: parent.radius
        anchors {
            verticalCenter: parent.verticalCenter
            right: background.right
        }
    }
    Rectangle{
        width: background.width
        height: background.height
        radius: background.radius
        color: 'transparent'
        border.color: '#a8a7a7'
        border.width: 2
    }
    Text{
        id: stateText
        text: "67"
        color: "#f0f0f0"
        font.pointSize: 11
        anchors{
            centerIn: background
        }
        font.weight: Font.Bold

    }

    Text{
        id:charger
        text:"󱐥"
        color: "#f0f0f0"
        font.pointSize: 14
        anchors{
            verticalCenter: background.verticalCenter
            verticalCenterOffset: -1.5
            left : background.right
            leftMargin: 3
        }
    }
   
    
    

}

