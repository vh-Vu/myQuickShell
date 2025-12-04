import QtQuick

Text {
    text: HyprlandData.activeWorkspace

    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
        leftMargin: 48
    }
    color: "#f0f0f0"
    font.pointSize: 16
    font.family: "FiraCode Nerd Font"
    font.weight: Font.DemiBold
}