import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls



Rectangle{
    id:root
    property string states: ["󰲝","󰲜","󰤟","󰤩","󰤭","󰤨","󰤥","󰤢"]
    color: 'transparent'
    width: 180
    height: childrenRect.height
    Text{
        id: stateText
        text: " 12 MB |  1.2 MB"
        color: "#f0f0f0"
        font.pointSize: 14
        anchors{
            verticalCenter: parent.verticalCenter
        }
    }
}