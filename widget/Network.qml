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
    
    Text{
        id: stateText
        text: "󰲝"
        color: "#f0f0f0"
        font.pointSize: 14
        anchors{
            verticalCenter: parent.verticalCenter
        }
    }
}