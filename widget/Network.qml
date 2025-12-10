import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls



Rectangle{
    id:root
    property string states: ["󰲝","󰲜","󰤟","󰤩","󰤭","󰤨","󰤥","󰤢"]
    color: 'transparent'
    width: 35
    height: childrenRect.height
    // border.width: 3
    // border.color: "white"
    Text{
        id: stateText
        text: "󰲝"
        color: "#f0f0f0"
        font.pointSize: 14
        anchors{
            verticalCenter: parent.verticalCenter
            centerIn: parent
        }
    }
}