pragma Singleton

import Quickshell
import Quickshell.Bluetooth
import Quickshell.Io

Singleton {
    id:root
    
    readonly property var defaultAdapter: Bluetooth.defaultAdapter
    readonly property string adapterId: defaultAdapter.adapterId
    readonly property var devices: defaultAdapter.devices
    readonly property int state: defaultAdapter.state

    function switchState() {
        switch(state){
            case EnumBluetoohState.Disable:
                this.enabled();
                break;
            case EnumBluetoohState.Enabled:
                this.disabled();
                break;
            case EnumBluetoohState.Blocked:
                this.unblock();
                break;
            default:
        }
    }

    function enabled(){
        turnOn.running = true;
    }

    function disabled(){
        turnOff.running = true;
    }

    function block(){
        block.running = true;
    }

    function unblock(){
        unblock.running = true;
    }

    Process{
        id: turnOff
        running: false
        command: ["bluetoothctl","power","off"]
    }
    Process{
        id: turnOn
        running: false
        command: ["bluetoothctl","power","on"]
    }
    Process{
        id: block
        running: false
        command: ["rfkill","block","bluetooth"]
    }
    Process{
        id: unblock
        running: false
        command: ["rfkill","unblock","bluetooth"]
    }

    onStateChanged: {
        
        //console.log("New State (Value):", state);

    }
    
}

