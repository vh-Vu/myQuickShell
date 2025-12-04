pragma Singleton

//import qs.config
import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import Quickshell.Io


Singleton {
    id: root

    property string previousSinkName: ""
    property string previousSourceName: ""

    readonly property var nodes: Pipewire.nodes.values.reduce((acc, node) => {
        if (!node.isStream) {
            if (node.isSink)
                acc.sinks.push(node);
            else if (node.audio)
                acc.sources.push(node);
        }
        return acc;
    }, {
        sources: [],
        sinks: []
    })

    readonly property list<PwNode> sinks: nodes.sinks
    readonly property list<PwNode> sources: nodes.sources

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property PwNode source: Pipewire.defaultAudioSource
    readonly property real volume: sink?.audio?.volume ?? 0
    readonly property bool muted: !!sink?.audio?.muted
    // property var volume:  {
    //     var v = sink.nickname
    //     console.log(sink.audio.channels);
    //     console.log(sink.audio.volume);
    //     console.log(sink.audio.muted);
    //     console.log(sink.audio.volumes);
    //     console.log("name:", sink.name);
    //     console.log("isSink:", sink.isSink);         
    //     console.log("description:", sink.description);
    //     console.log("type:", sink.type);
    //     console.log("id:", sink.id);

    //     if(isNaN(v)){
    //         volumeW_wpctl.running = true
    //         return;
    //     }
    //     return v;
    // }

    readonly property bool sourceMuted: !!source?.audio?.muted
    readonly property real sourceVolume: source?.audio?.volume ?? 0

    // property var test: volume

    // Process{
    //     id: volumeW_wpctl
    //     command:["wpctl","get-volume",sink.id]
    //     stdout: StdioCollector {
    //     onStreamFinished: root.volume = this.text.substring(8)
    //     }
    // }
    


    function setVolume(newVolume: real): void {
        if (sink?.ready && sink?.audio) {
            sink.audio.muted = false;
            sink.audio.volume = Math.max(0, newVolume);//Math.min(Config.services.maxVolume, newVolume)
        }
    }

    function incrementVolume(amount: real): void {
        setVolume(volume + amount); //(amount || Config.services.audioIncrement)
    }

    function decrementVolume(amount: real): void {
        setVolume(volume - (amount || Config.services.audioIncrement));
    }

    function setSourceVolume(newVolume: real): void {
        if (source?.ready && source?.audio) {
            source.audio.muted = false;
            source.audio.volume = Math.max(0, Math.min(Config.services.maxVolume, newVolume));
        }
    }
 
    function incrementSourceVolume(amount: real): void {
        setSourceVolume(sourceVolume + (amount || Config.services.audioIncrement));
    }

    function decrementSourceVolume(amount: real): void {
        setSourceVolume(sourceVolume - (amount || Config.services.audioIncrement));
    }

    function setAudioSink(newSink: PwNode): void {
        Pipewire.preferredDefaultAudioSink = newSink;
    }

    function setAudioSource(newSource: PwNode): void {
        Pipewire.preferredDefaultAudioSource = newSource;
    }

    onSinkChanged: {
        if (!sink?.ready)
            return;

        const newSinkName = sink.description || sink.name || qsTr("Unknown Device");

        if (previousSinkName && previousSinkName !== newSinkName && Config.utilities.toasts.audioOutputChanged)
            Toaster.toast(qsTr("Audio output changed"), qsTr("Now using: %1").arg(newSinkName), "volume_up");

        previousSinkName = newSinkName;
    }

    onSourceChanged: {
        if (!source?.ready)
            return;

        const newSourceName = source.description || source.name || qsTr("Unknown Device");

        if (previousSourceName && previousSourceName !== newSourceName && Config.utilities.toasts.audioInputChanged)
            Toaster.toast(qsTr("Audio input changed"), qsTr("Now using: %1").arg(newSourceName), "mic");

        previousSourceName = newSourceName;
    }

    Component.onCompleted: {
        previousSinkName = sink?.description || sink?.name || qsTr("Unknown Device");
        previousSourceName = source?.description || source?.name || qsTr("Unknown Device");
    }

    PwObjectTracker {
        objects: [...root.sinks, ...root.sources]
    }

}