import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls

import "../services/"


Rectangle{
    id:root
    property string states: ["","","",""]
    property real volume: (Audio.volume*100).toFixed(0)
    readonly property int fontSize: parent.fontSize
    readonly property string textColor: parent.textColor
    property int myWidth: parent.componentWidth
    property string myFont: parent.fontName
    
    property string currSate: getState(this.volume)

    function getState(volume){
        if(!volume) return states[0];
        if(volume < 33) return states[1];
        if(volume < 66) return states[2];
        return states[3];
    }
    color: 'transparent'
    width: myWidth

    height: childrenRect.height
    Text{
        id: stateText
        text: currSate
        color: root.textColor
        font{
            family: root.myFont
            pointSize: root.fontSize
            weight : Font.Bold
        }
        anchors{
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
    }
    Text{
        id: volumeText
        text: root.volume
        color: root.textColor
        visible: false
        font{
            family: root.myFont
            pointSize: root.fontSize
            weight : Font.Bold
        }
        anchors{
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

    }
    MouseArea{
        id: kh
        anchors.fill: root
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        enabled: true
        onClicked: Audio.openPannel();

        onWheel: (wheel) => {
            var delta = wheel.angleDelta.y;
            var numSteps = delta / 120;

            if (numSteps !== 0) {
                if( (root.volume<100 && root.volume > 0)||
                    (root.volume==100 && numSteps<=0) || (root.volume==0 && numSteps>=0)){
                        Audio.incrementVolume(numSteps/100);
                    }
            }

            wheel.accepted = true; 
        }
        states: [State {
            name: "hovered"
            when: kh.containsMouse
            PropertyChanges{
                target: volumeText
                visible: true
            }
            PropertyChanges{
                target:root
                width: myWidth*2
            }
            PropertyChanges{
                target:stateText
                anchors.rightMargin: root.myWidth/4
            }
            
            AnchorChanges { target: stateText; anchors.right : volumeText.left }
        }
        ]
        transitions: Transition {
            AnchorAnimation { duration: 300 }
            PropertyAnimation{
                properties: "width"
                duration: 300
                easing.type: Easing.OutCubic
            }
            PropertyAnimation{
                properties:"visible"
                duration: 200
            }
        }
    }

}

