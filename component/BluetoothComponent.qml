import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import "../services/"


Rectangle{
    id:root
   
    readonly property string disableColor: "#919191"
    readonly property string enableColor: "#f0f0f0"
    readonly property int state: Bluetooth.state
    readonly property string currenSatus: state === EnumBluetoohState.Blocked? "󰂲": ""
    readonly property string currentColor: state === EnumBluetoohState.Disable ? disableColor : enableColor
    property int myWidth: parent.componentWidth

    color: 'transparent'
    width: myWidth
    height: childrenRect.height
    // border.width: 3
    // border.color: "white"
    Text{
        id: stateText
        text: currenSatus
        color: currentColor
        font.pointSize: 14
        font.weight : Font.Bold
        //anchors.centerIn: parent
        anchors{
            verticalCenter: parent.verticalCenter
            centerIn: parent
        }
    }

    MouseArea{
        id: mouseArea
        anchors.fill: root
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        enabled: true
        acceptedButtons:Qt.RightButton
        onClicked:{
            if (mouseArea.enabled) {
                bluetoothPanel.running = true;
            }
        }
       
        
    }
    MouseArea{
        id: mouseArea2
        anchors.fill: root
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        enabled: true
        acceptedButtons:Qt.LeftButton
        onClicked:{
            if (mouseArea2.enabled) {
                //bluetoothPanel.running = true;
                Bluetooth.switchState()
            }
        }
    }


    // PropertyAnimation { 
    //     id: animation;
    //     target: stateText;
    //     property: "color";
    //     //to: 30;
    //     duration: 5000 
    // }
    Process {   
        id: bluetoothPanel
        command: [ "blueman-manager" ]
    }
}