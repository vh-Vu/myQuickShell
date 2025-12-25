pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

import Quickshell.Hyprland



Singleton{
    id: root
    property string activeWorkspace: "1";


    Connections {
        target: Hyprland
        
        function onFocusedWorkspaceChanged() {
            root.activeWorkspace = target.focusedWorkspace.id;
        }
    }
    // flash in ->>>>> current workspace


    
    Process {
        id: getActiveWorkspace
        running: true
        command: ["hyprctl", "activeworkspace", "-j"]
        stdout: StdioCollector {
            id: activeWorkspaceCollector
            onStreamFinished: {
                root.activeWorkspace = JSON.parse(activeWorkspaceCollector.text).id;
            }
        }
    }
}