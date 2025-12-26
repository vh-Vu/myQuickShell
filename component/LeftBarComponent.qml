import QtQuick
Rectangle {
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
    //border.width: 3 
    WorkspaceComponent{
        id: ws
    }
    // SystemMonitoringComponent{
    //     id: systemMonitoring
    //     anchors.left: ws.right
    // }
}