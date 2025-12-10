import QtQuick
import "../services"




Rectangle{
    id:root

    readonly property bool isLaptopBattery: Power.isLaptopBattery
    readonly property int fontSize: 14
    readonly property string textColor: "#f0f0f0"
    readonly property string fontName: "FiraCode Nerd Font"
    readonly property int componentWidth: 27

    height: parent.height
    width: parent.width/2.56
    color: "transparent"
    border.width: 3 
    anchors{
        right: parent.right
        verticalCenter: parent.verticalCenter
    }

    BluetoothComponent{
        id: buletoothStatus
        anchors{
              right: speakerStatus.left
              verticalCenter: parent.verticalCenter
        }
    }
    SpeakerComponent{
        id: speakerStatus
        anchors{
              right: isLaptopBattery ? powerStatus.left : parent.right
              verticalCenter: parent.verticalCenter
        }
    }

    PowerComponent{
        id: powerStatus
        visible: isLaptopBattery
        anchors{
          right: parent.right
          verticalCenter: parent.verticalCenter
        }
    }
}