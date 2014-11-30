import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import com.luke.qml 1.0


ApplicationWindow {
    title: qsTr("qmlPlayer")
    width: 640
    height: 480
    visible: true

    OMXMediaProcessor {
        id: mediaProcessor
        source: "/home/pi/BSG.mkv"
        autoPlay: false;
        onAudioStreamChanged: buttonTrack.text =  "Track " + mediaProcessor.audioStream;
        onPlaybackStateChanged: {
            console.debug("mediaProcessor playback state changed to " + mediaProcessor.playbackState);

            if (mediaProcessor.playbackState == 3)
                buttonPlay.text = "Pause";
            else
                buttonPlay.text = "Play";

            buttonStop.enabled = (mediaProcessor.playbackState == 3);

        }
    }

    OMXVideoSurface {

        id: omxVideoSurface
        width: 1280
        height: 720
        x: 300
        y: 130
        source: mediaProcessor
    }

    Button {
        id : buttonTrack
        x: 220
        y : 10
        width : 100
        height : 30
        text : "Audio Track"
        onClicked: {
            if (mediaProcessor.audioStream == 0)
                mediaProcessor.audioStream = 1;
            else
                mediaProcessor.audioStream = 0;
        }
    }

    Button {
        id : buttonPlay
        x: 20
        y : 10
        width : 100
        height : 30
        text : "Play"
        onClicked: {
           if (mediaProcessor.playbackState !== 3)
                mediaProcessor.play();
           else
               mediaProcessor.pause();
        }
    }

    Button {
        id : buttonStop
        x: 120
        y : 10
        width : 100
        height : 30
        text : "Stop"
        onClicked: mediaProcessor.stop();
    }


}
