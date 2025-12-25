import Quickshell
import QtQuick
import QtQuick.Controls
import "../services/"

Rectangle{
    id:root
    property int myWidth: parent.componentWidth
    property string stateIcon: ""
    property string currentColor: parent.textColor
    readonly property int fontSize: parent.fontSize


    color: 'transparent'
    width: myWidth*7
    height: childrenRect.height
    
    Text{
        text: stateIcon + "   4%  6Gi  50°C"
        color: currentColor
        font.family: "Solway"
        font.pointSize: fontSize
        anchors{
            centerIn: parent
        }
    }
}
