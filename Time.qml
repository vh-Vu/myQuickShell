// Time.qml

// with this line our type becomes a Singleton
pragma Singleton

import Quickshell
import QtQuick

// your singletons should always have Singleton as the type
Singleton {
  id: root
  property string time :
  {
    // The passed format string matches the default output of
    // the `date` command.
    //    Qt.formatDateTime(clock.date, "ddd MMM d hh:mm:ss AP t yyyy")

    Qt.formatTime(clock.date, "hh:mmAP").substring(0, 5);
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
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