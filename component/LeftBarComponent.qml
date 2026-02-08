import QtQuick

import Quickshell.Io
Rectangle {
    id:root
    readonly property bool isLaptopBattery: Power.isLaptopBattery
    readonly property int fontSize: 14
    readonly property string textColor: "#f0f0f0"
    readonly property string textEnableColor: "#f0f0f0"
    readonly property string textDisableColor: "#919191"
    readonly property string fontName: "FiraCode Nerd Font"
    readonly property int componentWidth: 27

    height: parent.height
    width: parent.width/2.56
    color: "transparent"
    //border.width: 3 
    WorkspaceComponent{
        id: ws
    }
    // SystemMonitoringComponent{
    //     id: systemMonitoring
    //     anchors.left: ws.right
    // }

    Text{
        id: healthCheckText
        property string status: "Loading..."
    
        text: status // Binding text vào biến status
        color: textColor

        // function fetchData() {
        //     let xhr = new XMLHttpRequest();
        //     xhr.open("GET", "https://netflix.com/healthcheck");
        //     xhr.onreadystatechange = function() {
        //         if (xhr.readyState === XMLHttpRequest.DONE) {
        //             if (xhr.status === 200) {
        //                 // Cập nhật kết quả vào status
        //                 healthCheckText.status = xhr.responseText;
        //             } else {
        //                 healthCheckText.status = "Error " + xhr.status;
        //             }
        //         }
        //     }
        //     xhr.send();
        // }
        // Component.onCompleted: fetchData()

        Component.onCompleted: {
        loadEnv();}
        anchors.left: ws.right
        
    }

    FileView {
        id: envFile
        path: Qt.resolvedUrl("./weather.api")
    // Forces the file to be loaded by the time we call JSON.parse().
    // see blockLoading's property documentation for details.
        blockLoading: true
    

    }


    // function loadEnv() {
    //                 console.log("Đã  0 tải API Key thành công!");

    //         let content = envFile.readAll(); // Đọc toàn bộ nội dung file
    //                     console.log("Đã tải API Key thành công!");

    //         let lines = content.split("\n");
        function loadEnv() {
        // Kiểm tra xem data đã có dữ liệu chưa
        if (envFile.data) { 
            // envFile.data là một object, cần .toString() để lấy text
            let content = envFile.data.toString(); 
            console.log("Nội dung file: " + envFile.text());
            healthCheckText.text =    envFile.text() 
            let lines = content.split("\n");
            for (let i = 0; i < lines.length; i++) {
                    let line = lines[i].trim();
                    if (line.startsWith("#") || line === "") continue; // Bỏ qua comment/dòng trống
                    
                    let parts = line.split("=");
                    if (parts.length === 2) {
                        let key = parts[0].trim();
                        let value = parts[1].trim();
                        healthCheckText.text =    envFile.text() 
                        // if (key === "WEATHER_API_KEY") apiKey = value;
                        // if (key === "WEATHER_API_URL") apiUrl = value;
                    }
                }
                console.log("Đã tải API Key thành công!");
            // ... tiếp tục logic parse của bạn
        } else {
            console.log("Data vẫn đang trống hoặc file không tồn tại");
        }
    }        
            
        
    //}

    


}
    