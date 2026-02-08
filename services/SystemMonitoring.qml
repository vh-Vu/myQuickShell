pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property int ticks: 0
    property double cpuOldWork: 0
    property double cpuOldTotal: 0
    property string cpuUsedDisplay: "--"
    property string cpuTempDisplay: "--"
    property string gpuUsedDisplay: "--"
    property string memUsedDisplay: "--"
    
    Process{
        id: getCpuUsed
        running: false
        command: ["sh","-c","grep 'cpu ' /proc/stat | awk '{print $2+$3+$4, $2+$3+$4+$5+$6+$7+$8}'"]
        stdout: StdioCollector {
            id: stdoutCpuUsed
            onStreamFinished: {
                var output = stdoutCpuUsed.text.split(" ");
                if (output.length < 2) return;
                var newWork = parseFloat(output[0]);
                var newTotal = parseFloat(output[1]);
                if(cpuOldWork>0){
                    var deltaWork = newWork - cpuOldWork;
                    var deltaTotal = newTotal - cpuOldTotal;
                    if(deltaTotal > 0){
                        var usage = (deltaWork / deltaTotal) * 100;
                        cpuUsedDisplay = usage.toFixed(0);
                    }
                }
                cpuOldWork = newWork;
                cpuOldTotal = newTotal;
            }
        }
    }

    Process{
        id: getCpuTemp
        running: false
        command: ["sh","-c","cat /sys/class/hwmon/hwmon3/temp1_input | awk '{printf \"%.0f\", $1/1000}'"]
        stdout: StdioCollector {
            id: stdoutCpuTemp
            onStreamFinished: { 
                cpuTempDisplay = stdoutCpuTemp.text
            }
        }

    }

    Process{
        id: getMemUsed
        running: false
        command: ["sh","-c","free | grep 'Mem' | awk '{print $3}'"]
        stdout: StdioCollector {
            id: stdoutMemUsed
            onStreamFinished: {
                memUsedDisplay = (parseFloat(stdoutMemUsed.text)/1_048_576).toFixed(1)
            }
        }
    }

    Process{
        id: getGpuUsed
        running: false
        
        command: ["sh","-c","cat /sys/class/drm/card1/device/gpu_busy_percent"]
        stdout: StdioCollector {
            id: stdoutGpuUsed
            onStreamFinished: {
                gpuUsedDisplay = stdoutGpuUsed.text.trim()
            }
        }
        
    }

    Timer{
        id: sandClock
        running: false
        repeat: true
        interval: 250
        onTriggered: {
            ticks = (ticks+1)%24;
            switch(ticks%8){
                case 0:
                    getCpuUsed.running = true;
                    break;
                case 2:
                    getGpuUsed.running = true;
                    break;
                case 1:
                    if(ticks == 1) getMemUsed.running = true
                    break;
                case 3:
                    if(ticks == 3) getCpuTemp.running = true;
                    break;
            }
        }
    }

    function start(){
        sandClock.start();
    }
    function stop(){
        sandClock.stop();
    }

}