import QtQuick 2.0
Rectangle{
    property alias mySource1:img1.source
    property alias mySource2:img2.source
    property alias fuelstatus:img1.opacity


   /* MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.margins: -10}
        hoverEnabled: true         //this line will enable mouseArea.containsMouse
        onClicked: Qt.quit()//Tells the application to exit with return code 0 (success). Equivalent to calling QCoreApplication::exit(0).
    }*/



    state: "Ignition_on"//this is for ignition
    states:[
        State{
            name:"Ignition_on"
            PropertyChanges { target: img1;source:mySource1;scale: 0.15; opacity: fuelstatus}
            PropertyChanges { target: img2;source:mySource2; scale: 0.15; opacity:!(fuelstatus)}
        },
        State{
            name:"Ignition_off"
            PropertyChanges { target: img1;source:mySource1; scale: 0.8; opacity: 0}
            PropertyChanges { target: img2;source:mySource2; scale: 0.8; opacity: 1}
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
        opacity: fuelstatus
        //opacity: 0
       //anchors.fill: img2
    }
    Image {
         smooth: true
        id: img2
        source:mySource2
        opacity: fuelstatus

      //  opacity: 1
       // anchors.fill: img1

    }
}





