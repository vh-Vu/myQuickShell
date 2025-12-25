// Time.qml

pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  property string time :
  {

    Qt.formatTime(clock.date, "hh:mmAP").substring(0, 5);
  }

  property string date: {
      Qt.formatDate(clockHour.date, "dd");
  }
  property string dateOfWeek: {
      Qt.formatDate(clockHour.date, "dddd");
  }

  property string month: {
      Qt.formatDate(clockHour.date, "MM");
  }
  property string monthName: {
      Qt.formatDate(clockHour.date, "MMM");
  }

  property string year: {
      Qt.formatDate(clockHour.date, "yyyy");
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }

   SystemClock {
    id: clockHour
    precision: SystemClock.hours
  }

//   Process {
//     id: dateProc
//     command: ["date","+%I:%M"]
//     running: true

//     stdout: StdioCollector {
//       onStreamFinished: root.time = this.text
//     }
//   }

//   Timer {
//     interval: 10000
//     running: true
//     repeat: true
//     onTriggered: dateProc.running = true
//   }
}