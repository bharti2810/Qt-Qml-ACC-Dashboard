import QtQuick 2.0
Rectangle{
    property alias mySource1:img1.source
    property alias mySource2:img2.source

   /* MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.margins: -10}
        hoverEnabled: true         //this line will enable mouseArea.containsMouse
        onClicked: Qt.quit()//Tells the application to exit with return code 0 (success). Equivalent to calling QCoreApplication::exit(0).
    }*/



    state: "image1"
    states:[
        State{
            name:"image1" /*"mouse-over"*/; when: mouseArea.containsMouse
            PropertyChanges { target: img1;source:mySource1; scale: 0.8; opacity: 0}
            PropertyChanges { target: img2;source:mySource2; scale: 0.8; opacity: 1}
        },
        State{
            name:"image2" /*"mouse-over"*/; when: mouseArea.containsMouse
            PropertyChanges { target: img1;source:mySource1; scale: 0.8; opacity: 1}
            PropertyChanges { target: img2;source:mySource2; scale: 0.8; opacity: 0}
        }
    ]


/*
    transitions:[//To make slow transition
        Transition {
            from: "*"
            to: "*"

            NumberAnimation { properties: "scale, opacity"; easing.type: Easing.InOutQuad; duration: 1000  }
            PropertyAnimation { properties: "source";   }
        }]*/



    Image {
         smooth: true
        id: img1
        source:mySource1
        //opacity: 0
       //anchors.fill: img2
    }
    Image {
         smooth: true
        id: img2
        source:mySource2
      //  opacity: 1
       // anchors.fill: img1

    }

}

