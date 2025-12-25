import QtQuick
import "../services"




Rectangle{
    id:root

    readonly property bool isLaptopBattery: Power.isLaptopBattery
    readonly property int fontSize: 14
    readonly property string textColor: "#f0f0f0"
    readonly property string textEnableColor: "#f0f0f0"
    readonly property string textDisableColor: "#919191"
    readonly property string fontName: "FiraCode Nerd Font"
    readonly property int componentWidth: 27

    height: parent.height
    width: parent.width/2.56
    color: "transparent"
    border.width: 3 

    NetworkComponent{
        id: networkStatus
        anchors{
              right: buletoothStatus.left
              verticalCenter: parent.verticalCenter
        }
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
              right: isLaptopBattery ? powerStatus.left : healthyStatus.left
              verticalCenter: parent.verticalCenter
        }
    }

    PowerComponent{
        id: powerStatus
        visible: isLaptopBattery
        anchors{
          right: healthyStatus.left
          verticalCenter: parent.verticalCenter
        }
    }

    SystemMonitoringComponent{
        id: healthyStatus
        anchors{
          right: parent.right
          verticalCenter: parent.verticalCenter
        }
    }
}