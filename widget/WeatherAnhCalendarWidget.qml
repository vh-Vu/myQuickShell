import QtQuick.Window
import QtQuick.Controls
import Qt5Compat.GraphicalEffects



Popup {
    property int width_popup: 800
    property int height_popup: 400
    
    id: popup
    x: Screen.width / 2 - width_popup/2
    y: 35
    popupType: Popup.Native
    width: width_popup
    height: height_popup
    background: Rectangle {
        id: wborder



        Weather{
            x: 10
            y: 10
            realFeel: 23
        }

        MyCalendar{
            x: 300
            y: 10
        }






        color: "#ee111116"

        property Gradient borderGradient: borderGradient
        property int borderWidth: 2

        radius: 13
        Loader {
            id: loader
            width: width_popup
            height: height_popup
            active: borderGradient
            sourceComponent: border
        }

        Gradient {
            id: borderGradient
            GradientStop { position: 0.00; color: '#aadddddd' } 
            
            GradientStop { position: 0.11; color: '#cc97c9c9' } 
            
            GradientStop { position: 0.22; color: '#ccb8c2d9' }
            
            GradientStop { position: 0.33; color: '#aab9d9c9' }
            
            GradientStop { position: 0.44; color: '#aaffffff' } 
            
            GradientStop { position: 0.50; color: '#bbffffff' } 
            
            GradientStop { position: 0.56; color: '#aaffffff' } 
            
            GradientStop { position: 0.67; color: '#ccb1a3b9' } 
            
            GradientStop { position: 0.78; color: '#ccb3bad9' } 
            
            GradientStop { position: 0.89; color: '#aad9c3b9' }
            
            GradientStop { position: 1.00; color: '#aadddddd' }
        }
        

        Component {
            id: border
            Item {
                ConicalGradient {
                    id: borderFill
                    anchors.fill: parent
                    gradient: borderGradient
                    visible: false
                }

                Rectangle {
                    id: mask
                    radius: wborder.radius
                    border.width: wborder.borderWidth
                    anchors.fill: parent
                    color: 'transparent'
                    visible: false// otherwise a thin border might be seen.
                }

                OpacityMask {
                    id: opM
                    anchors.fill: parent
                    source: borderFill
                    maskSource: mask
                }
            }
        }

       
    }
    
        
    
    modal: true
    focus: true
    parent: Overlay.overlay

    closePolicy: Popup.CloseOnEscape || Popup.CloseOnPressOutsideParent
     enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
    }
    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0 }
    }
}


