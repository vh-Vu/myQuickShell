import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls

import "../services/"


Rectangle{
    id:root
    property string states: ["","","",""]
    property string currSate: getState(this.volume)
    property real volume: (Audio.volume*100).toFixed(0)
    function getState(volume){
        if(!volume) return states[0];
        if(volume < 33) return states[1];
        if(volume < 66) return states[2];
        return states[3];
    }
    color: 'transparent'
    width: 40
    // anchors{
    //     right: parent.right
    //     verticalCenter: parent.verticalCenter
    // }
    height: childrenRect.height
    Text{
        id: stateText
        text: currSate
        color: "#f0f0f0"
        font.pointSize: 14
        anchors{
            verticalCenter: parent.verticalCenter
        }
    }
    Text{
        id: volumeText
        text: ""
        color: "#f0f0f0"
        font{
            family: "FiraCode Nerd Font"
            pointSize: 14
            weight : Font.Bold
        }
        anchors{
            left : stateText.right
            verticalCenter: parent.verticalCenter
            leftMargin: 7
        }

    }
    MouseArea{
        id: kh
        anchors.fill: root
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        enabled: true
        onClicked:{
            if (kh.enabled) {
                audioPanel.running = true;
                kh.enabled = false;
                clickDebouncer.running = true;
            }
        }
        onWheel: (wheel) => {
            var delta = wheel.angleDelta.y;
            var numSteps = delta / 120;

            if (numSteps !== 0) {
                if( (root.volume<100 && root.volume > 0)||
                    (root.volume==100 && numSteps<=0) || (root.volume==0 && numSteps>=0)){
                        Audio.incrementVolume(numSteps/100);
                    }
            }

            wheel.accepted = true; // Chặn lan truyền sự kiện
        }
        states: [State {
            name: "hovered"
            when: kh.containsMouse
            PropertyChanges{
                target: volumeText
                text: root.volume
            }
            PropertyChanges{
                target:root
                width: 70
            }
        }
        ]
    }
    Process {   
        id: audioPanel
        command: [ "pavucontrol" ]
    }


    Timer {
        id: clickDebouncer
        interval: 200
        running: false
        repeat: false
        onTriggered: {
            kh.enabled = true
        }
    }
    
    

}

