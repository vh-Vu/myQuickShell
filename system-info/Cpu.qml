pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Io 
Singleton{
    id:root

    property var load: 10
    // CpuStatus { 
    //     id: cpuStatus 
    
    // }
    Timer {
        interval: 10000
        running: true
        repeat: true
        onTriggered: cpu_minitor.running = true
    }
    // Text {
    //     property string loadPercent: Number(cpuStatus.cpuLoad * 100).toLocaleString(Qt.locale("en_US"), 'f', 1)
    //     text: "cpuLoad: " + loadPercent + "%"
    // }
    Process {
        id: cpu_minitor
        running: true
        command: [ "sh", "./.config/quickshell/script/cpu_info.sh" ]
        stdout: StdioCollector {
            onStreamFinished: load = this.text.substring(0,2)
        }
    }

}