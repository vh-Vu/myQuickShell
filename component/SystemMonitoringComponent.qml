import QtQuick
import "../services/"

Rectangle{
    id:root
    property int myWidth: parent.componentWidth
    property string stateIcon: "󰍹"
    property string currentColor: parent.textColor
    readonly property int fontSize: parent.fontSize


    color: 'transparent'
    width: myWidth
    height: childrenRect.height
    
    Text{
        id: icon
        text: stateIcon 
        color: currentColor
        font.family: "Solway"
        font.pointSize: fontSize
        anchors{
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: fontSize
        }
    }

    Text{
        id: systemStatus
        visible: false
        text: `${SystemMonitoring.cpuUsedDisplay}% ${SystemMonitoring.cpuTempDisplay}° ${SystemMonitoring.gpuUsedDisplay}% ${SystemMonitoring.memUsedDisplay}Gi`
        color: currentColor
        font.family: "JetBrains Mono Nerd Font"
        font.pointSize: 12
        anchors{
            verticalCenter: parent.verticalCenter
            left: icon.right
            leftMargin: fontSize
        }
    }

    MouseArea{
        id:mouseArea
        anchors.fill: root
        cursorShape: Qt.PointingHandCursor
        enabled: true
        property bool onRun : false
        onClicked:{
            if(onRun) {
                SystemMonitoring.stop()
                systemStatus.visible = false
            }
            else{ 
                SystemMonitoring.start()
                systemStatus.visible = true
            }
            onRun = !onRun
        }
    }
    states: [
        State {
            name: "expanded"
            when: mouseArea.onRun
            PropertyChanges { 
                target: root
                width: icon.width + systemStatus.width + (fontSize * 2.5) 
            }
            PropertyChanges { 
                target: systemStatus
                opacity: 1
            }
        },
        State {
            name: "collapsed"
            when: !mouseArea.onRun
            PropertyChanges { 
                target: root
                width: icon.width + (fontSize * 2) 
            }
            PropertyChanges { 
                target: systemStatus
                opacity: 0
            }
        }
    ]

    transitions: [
        Transition {
            from: "collapsed"; to: "expanded"
            NumberAnimation { properties: "width"; duration: 500; easing.type: Easing.OutCubic }
            NumberAnimation { target: systemStatus; property: "opacity"; duration: 400; easing.type: Easing.InQuad }
        },
        Transition {
            from: "expanded"; to: "collapsed"
            NumberAnimation { properties: "width"; duration: 500; easing.type: Easing.InOutCubic }
            NumberAnimation { target: systemStatus; property: "opacity"; duration: 400 }
        }
    ]
}
