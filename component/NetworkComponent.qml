import Quickshell
import QtQuick
import QtQuick.Controls
import "../services/"

Rectangle{
    id:root
    property int myWidth: parent.componentWidth
    property string stateIcon: getState()
    property string currentColor: parent.textColor
    readonly property int fontSize: parent.fontSize
    readonly property var wifiLevels: {
        "global": [
            { threshold: 30, icon: "󰤯" }, { threshold: 55, icon: "󰤟" }, 
            { threshold: 70, icon: "󰤢" }, { threshold: 80, icon: "󰤥" }, { threshold: 101, icon: "󰤨" }
        ],
        "local": [
            { threshold: 30, icon: "󰤫" }, { threshold: 55, icon: "󰤠" }, 
            { threshold: 70, icon: "󰤣" }, { threshold: 80, icon: "󰤦" }, { threshold: 101, icon: "󰤩" }
        ]
    }

    color: 'transparent'
    width: myWidth
    height: childrenRect.height
    
    Text{
        text: stateIcon
        color: currentColor
        font.pointSize: fontSize
        anchors{
            centerIn: parent
        }
    }

    function getState(){
        var connectionState = Network.state
        if(connectionState == "disconnected") return "󰲜"
        var isGlobalConnection = "connected" === connectionState;
        var connectionType = Network.primaryConnectionType;
        if(connectionType == "ethernet") return isGlobalConnection ? "󰲝" : "󰱟"
        if(connectionType == "wifi") {
            let level = wifiLevels[isGlobalConnection ? "global" : "local"].find(l => Network.wifiStrength < l.threshold);
            return level.icon
        }
        return "!"
        
    }
}