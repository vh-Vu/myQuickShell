import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import Quickshell.Hyprland

import "./system-info/"
import "./widget/"




Scope {

  Variants {
    model: Quickshell.screens
      PanelWindow {
        required property var modelData

        anchors {
          top: true
          left: true
          right: true
        }
        color: Qt.rgba(0, 0, 0, 0.65)
        implicitHeight: 35

  
        Text {
          id: logoArch
          anchors{
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 18
          }
          text:""
          color: "#f0f0f0"
          font.pointSize: 18
          font.family: "FiraCode Nerd Font"
          font.weight: Font.DemiBold
          MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
             const launcher = Qt.createQmlObject(`
                import Quickshell
                import Quickshell.Io

                Process {
                    // Ví dụ chạy pavucontrol (thay bằng app/script của bạn)
                    //command: ["pavucontrol"]
                    //command: ["alacritty","fastfetch"]
                    // Hoặc chạy script: command: ["sh", "-c", "~/.config/hypr/scripts/myscript.sh"]
                    // Hoặc chạy fastfetch trong terminal: command: ["kitty", "fastfetch"]
                    // Hoặc rofi/wofi: command: ["wofi", "--show", "drun"]

                   running: true
                      command: ["sh", "-c", "echo -e \\"pavucontrol\\nwofi --show drun\\nalacritty fastfetch\\" | wofi --dmenu | sh"]
                }
            `, mouseArea, "dynamicLauncher");

              
               width: 800
               height: 800

            }
            hoverEnabled: true
            states: State {
            name: "hovered"
            when: mouseArea.containsMouse
            PropertyChanges {
                target: logoArch
                color: '#1897d2'
              }
            }
            transitions: Transition { ColorAnimation { duration: 200 } }
          }
      }
    
      Workspace {}
      ClockWidget {
        id: clockWidget
      }

      NetworkSpeed{
        id: networkSpeedStatus
        anchors{
              right: performenceStatus.left
              verticalCenter: parent.verticalCenter
        }
      }
      Performence{
        id: performenceStatus
        anchors{
              right: vpnStatus.left
              verticalCenter: parent.verticalCenter
        }
      }
      VPN{
        id: vpnStatus
        anchors{
              right: networkStatus.left
              verticalCenter: parent.verticalCenter
        }
      }

      Network{
        id: networkStatus
        anchors{
              right: buletoothStatus.left
              verticalCenter: parent.verticalCenter
        }
      }

      Bluetooth{
        id: buletoothStatus
        anchors{
              right: speakerStatus.left
              verticalCenter: parent.verticalCenter
        }
      }

      Speaker {
        id: speakerStatus
        anchors{
              right: powerStatus.left
              verticalCenter: parent.verticalCenter
        }
      }
          
      
      Power{
        id: powerStatus
         anchors{
          right: parent.right
          verticalCenter: parent.verticalCenter
        }
      }
      
    }
  }
}


