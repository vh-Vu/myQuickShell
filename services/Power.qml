pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Services.UPower 

Singleton {
    id:root
    property var devices: UPower.devices
    property var displayDevice: UPower.displayDevice
    readonly property bool isLaptopBattery: displayDevice.isLaptopBattery
    property var onBattery: UPower.onBattery
    property var state: UPowerDevice.state
    
}