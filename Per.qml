// good.qml
import QtQuick

Item {
    id: root
    width: 200
    height: 200
    property int accumulatedValue: 0

    Text {
        anchors.fill: parent
        text: root.accumulatedValue.toString()
        onTextChanged: console.log("text binding re-evaluated")
        color: "#f0f0f0"
        font{
            pointSize: 14
            family: "FiraCode Nerd Font"
        }
    }

    Component.onCompleted: {
        var someData = [ 1, 2, 3, 4, 5, 20 ];
        var temp = accumulatedValue;
        for (var i = 0; i < someData.length; ++i) {
            temp = temp + someData[i];
        }
        accumulatedValue = temp;
    }
}