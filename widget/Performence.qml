import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls



Rectangle{
    id:root
    property string states: ["󰲝","󰲜","󰤟","󰤩","󰤭","󰤨","󰤥","󰤢"]
    color: 'transparent'
    width: 40
    height: childrenRect.height
   
    Rectangle{
        id: monitor
        height: parent.height
        width: 30
        anchors.centerIn: parent
        color: 'transparent'
        border.color: "#f0f0f0"
    }
    Text{
        id: stateText
        text: ""
        color: "#f0f0f0"
        font.pointSize: 12
        anchors.centerIn: parent
    }
}