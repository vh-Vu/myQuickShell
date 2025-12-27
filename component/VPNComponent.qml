import QtQuick
import "../services/"


Rectangle{
    id:root
    property int myWidth: parent.componentWidth
    readonly property string disableColor: parent.textDisableColor
    readonly property string enableColor: parent.textEnableColor
    readonly property int fontSize: parent.fontSize
    color: 'transparent'
    width: myWidth*1.5
    height: childrenRect.height
    // border.width: 1
    // border.color: currentColor

    Text{
        text: "VPN"
        color: disableColor
        font.pointSize : 12
        anchors{
            centerIn: parent
        }
    }   
}